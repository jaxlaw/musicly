\version "2.18.2"
\include "scale_gen.ly"
\include "scales.ly"
\header {
  title = "3 Octaves Scales"
  composer = "Jax Law"
}
\markup { "D Major" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d2 } { d } \dMajorThreeOctave
    \bar "||"
  }
}
\markup { "2 in a bow patterns" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d( d) d d } \dMajorThreeOctave
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d d( d) d } \dMajorThreeOctave
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d d d( d) } \dMajorThreeOctave
    \bar "||"
  }
}
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d4 } { d d d d( d) d d d } \dMajorThreeOctave
    \bar "||"
  }
}
\markup { "4 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8 } { d( d d d) } \dMajorThreeOctave
    \bar "||"
  }
}
\pageBreak
\markup { "8 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8 } { d( d d d d d d d) } \dMajorThreeOctave
    \bar "||"
  }
}
\markup { "12 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d16 } { d( d d d d d d d d d d d) } \dMajorThreeOctave
    \bar "||"
  }
}
\markup { "16 in a bow" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d16 } { d( d d d d d d d d d d d d d d d) } \dMajorThreeOctave
    \bar "||"
  }
}
\markup { "other rhythm patterns" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8.[-. d16] } { d4( d) } \dMajorThreeOctave
    \bar "||"
  }
}


