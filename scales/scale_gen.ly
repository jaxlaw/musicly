\version "2.18.2"
#(begin
  ; return first n NoteEvents and ignore the non NoteEvents.
  (define (first-n l num)
    (cond ((null? l) l)
      ((= num 0) '())
      ((eq? 'NoteEvent (ly:music-property (car l) 'name))
       (cons (car l) (first-n (cdr l) (- num 1))))
       (else
        (first-n (cdr l) num))))
  ; take first n NoteEvents and return the rest including the non NoteEvents.
  (define (take-n l num)
    (cond ((null? l) l)
      ((= num 0) l)
      ((eq? 'NoteEvent (ly:music-property (car l) 'name))
       (take-n (cdr l) (- num 1)))
      (else (cons (car l) (take-n (cdr l) num)))))

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
     ; emit non NoteEvent and continue merging the rest.
     ((not (eq? 'NoteEvent (ly:music-property (car n) 'name)))
      (cons (car n) (merge-music (cdr n) r b)))
     ((eq? 'TimeScaledMusic (ly:music-property (car r) 'name))
      ; deal with tuplets
      (let ((tm (ly:music-deep-copy (car r)))
            (tnotes (ly:music-property (car r) 'element))
            (i (ly:music-property (car r) 'denominator)))
        (ly:music-set-property! tm 'element
          (make-music 'SequentialMusic 'elements
            (merge-music (first-n n i)
              (ly:music-property tnotes 'elements) (first-n b i))))
        (cons tm (merge-music (take-n n i) (cdr r) (take-n b i))))
      )
     ; normal case, merge note events.
     ((eq? 'NoteEvent (ly:music-property (car n) 'name))
      (cons (merge-note (car n) (car r) (car b))
        (merge-music (cdr n) (cdr r) (cdr b))))
     (else '())
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
