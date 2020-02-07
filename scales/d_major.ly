\version "2.18.2"
\include "scale_gen.ly"
\include "scales.ly"
\header {
  title = "3 Octaves Scales"
  composer = "Jax Law"
}
scale = \dMajorThreeOctave
\markup { "D Major" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d2 } { d } \scale
    \bar "||"
  }
}
\markup { "2 in a bow patterns" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d( d) d d } \scale
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d d( d) d } \scale
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d d d( d) } \scale
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d) d d d( } \scale
    \bar "||"
  }
}
\markup { "4 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8 } { d( d d d) } \scale
    \bar "||"
  }
}
\pageBreak
\markup { "8 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8 } { d( d d d d d d d) } \scale
    \bar "||"
  }
}
\markup { "12 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d16 } { d( d d d d d d d d d d d) } \scale
    \bar "||"
  }
}
\markup { "16 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d16 } { d( d d d d d d d d d d d d d d d) } \scale
    \bar "||"
  }
}
\markup { "triplets" }
\score {
  {
    \numericTimeSignature \time 2/4
    \displayMusic \ApplyPatterns { \tuplet 3/2 { d8 d d } } { d( d d) } \scale
    \bar "||"
  }
}
\markup { "other rhythm patterns" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8.[-. d16] } { d4( d) } \scale
    \bar "||"
  }
}


