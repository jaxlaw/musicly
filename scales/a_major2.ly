% Scales for Cello
\include "scale_gen.ly"
\version "2.18.2"
\language "english"
\header {
  title = "A major 2 Octaves Scales"
  composer = "Jax Law"
}
scale = {
  \key a \major
  \clef "bass"
  a,4
  b, csharp d e
  fsharp gsharp a b
  csharp' d' e' fsharp'
  gsharp' a' gsharp' fsharp'
  e' d' csharp' b
  a gsharp fsharp e
  d csharp b, a, b, csharp a,
}
\markup { "A Major" }
\score {
  {
    \numericTimeSignature \time 4/4
    \scale
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
    \ApplyPatterns { d8 } { d( d d d) } \scale
    \bar "||"
  }
}
\markup { "8 in a bow" }
\score {
  {
    \ApplyPatterns { d8 } { d( d d d d d d d) } \scale
    \bar "||"
  }
}
\markup { "8-16 rythm" }
\score {
  {
    \numericTimeSignature \time 4/4
    \ApplyPatterns { d8.[-. d16] } { d4( d) } \scale
    \bar "||"
  }
}

