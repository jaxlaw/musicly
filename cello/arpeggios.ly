% LilyBin
\version "2.18.2"
\language "english"
\header {
  title = "2 Octave Arpeggios"
  composer = "Adrianna Khoo"
}
aMinorArpeggio = {
  \clef "bass" a2-1 c-4 e-1 a-1 c-4 e-1 
  \clef "treble" a\thumb c-2 e-1 a-3 e c a 
  \clef "bass" e c a e c a
}
cDimArpeggio = {
  \clef "bass"
  c ef-1 gf-4 c-3 ef-1 gf-4 c-3 ef-1 gf-4 c-3
  gf-4 ef-1 c-3 gf-4 ef-1 c-3 gf-4 ef-1 c
}
cAugArpeggio = {
  \clef "bass"
  c e-4 gs-1 c-4 e-1 gs-4^"x" c-1 e-1 gs-4^"x" c-3
  gs e c gs e c gs e c
}
\markup { A Minor }
\score{
  \new Staff {   
    \relative a, {
      \aMinorArpeggio \bar "||"
    }
  }
  \layout {}
}
\markup { C Diminished, minor 3rd plus dim. 5 }
\score{
  \new Staff {   
    \relative c, {
      \cDimArpeggio \bar "||"
    }
  }
  \layout {}
}
\markup { C Augmented, major 3rd plus aug. 5 }
\score{
  \new Staff {   
    \relative c, {
      \cAugArpeggio \bar "||"
    }
  }
  \layout {}
}
