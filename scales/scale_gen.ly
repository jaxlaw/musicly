% LilyBin
\include "scales.ly"
\version "2.18.2"
#(begin
  ; Merge all the properties into one note.
  (define (merge-note p r b)
    (let ((note (ly:music-deep-copy p)))
      (ly:music-set-property! note 'articulations
        (append 	(ly:music-property p 'articulations)
          (ly:music-property r 'articulations)
          (ly:music-property b 'articulations)))
      (ly:music-set-property! note 'duration
        (ly:music-property r 'duration))
      note)
    )
  ; Merge all notes from 3 lists.
  (define (merge-music n a b)
    (if (null? n) '()
        (if (eq? 'NoteEvent (ly:music-property (car n) 'name))
            (cons (merge-note (car n) (car a) (car b))
              (merge-music (cdr n) (cdr a) (cdr b)))
            (cons (car n) (merge-music (cdr n) a b)))
        ))

  ; count NoteEvent notes.
  (define (count-notes n)
    (if (null? n) 0
        (if (eq? 'NoteEvent (ly:music-property (car n) 'name))
            (+ 1 (count-notes (cdr n)))
            (count-notes (cdr n)))))

  ; duplicate music to make n notes.
  (define (duplicate mus n)
    (if (>= (length mus) n)
        mus
        (append mus (duplicate mus (- n (length mus))))))
  )

RepeatFlatten =
#(define-music-function
  (parser location n mus)
  (number? ly:music?)
  (let ((notes ((ly:music-property notes 'elements))))
    (make-music 'SequentialMusic 'elements
      (duplicate notes (* (count-notes notes) n)))))

ApplyPatterns =
#(define-music-function
  (parser location notes rhythm bowing)
  (ly:music? ly:music? ly:music?)
  (make-music 'SequentialMusic 'elements
    (merge-music
     (ly:music-property notes 'elements)
     (duplicate (ly:music-property rhythm 'elements)
       (count-notes (ly:music-property notes 'elements)))
     (duplicate (ly:music-property rhythm 'elements)
       (count-notes (ly:music-property notes 'elements))))))

\score {
  {
    \numericTimeSignature \time 4/4
    %\ApplyPatterns \dMajorThreeOctave { d8.[-. d16] } { d4( d) }
    \displayMusic \RepeatFlatten 4 { d4( d) }
    %
  }
}
