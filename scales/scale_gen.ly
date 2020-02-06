\version "2.18.2"
#(begin
  ; slice list function.
  (define (slice l offset len)
    (if (null? l) l
        (if (> offset 0)
            (slice (cdr l) (- offset 1) len)
            (if (> len 0)
                (cons (car l) (slice (cdr l) 0 (- len 1)))
                '()))))

  (define (tail l offset)
    (slice l offset (+ (- (length l) offset) 1)))

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
  (define (merge-music n r b)
    (cond
     ((null? n) '())
     ((null? r) '())
     ((null? b) '())
     ((eq? 'TimeScaledMusic (ly:music-property (car r) 'name))
      ; deal with tuplets
      (let ((tm (ly:music-deep-copy (car r)))
            (tnotes (ly:music-property (car r) 'element))
            (i (ly:music-property (car r) 'denominator)))
        (ly:music-set-property! tm 'element
          (make-music 'SequentialMusic 'elements
            (merge-music (slice n 0 i)
              (ly:music-property tnotes 'elements) (slice b 0 i))))
        (cons tm (merge-music (tail n i) (cdr r) (tail b i))))
      )
     ; normal case, merge note events.
     ((eq? 'NoteEvent (ly:music-property (car n) 'name))
      (cons (merge-note (car n) (car r) (car b))
        (merge-music (cdr n) (cdr r) (cdr b))))
     ; emit non NoteEvent and continue merging the rest.
     (else (cons (car n) (merge-music (cdr n) r b)))
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
  (make-music 'SequentialMusic 'elements
    (duplicate (ly:music-property mus 'elements) n)))

ApplyPatterns =
#(define-music-function
  (parser location rhythm bowing notes)
  (ly:music? ly:music? ly:music?)
  (make-music 'SequentialMusic 'elements
    (merge-music
     (ly:music-property notes 'elements)
     (duplicate (ly:music-property rhythm 'elements)
       (count-notes (ly:music-property notes 'elements)))
     (duplicate (ly:music-property bowing 'elements)
       (count-notes (ly:music-property notes 'elements))))))
