\version "2.18.2"
\include "scale_gen.ly"
\include "scales.ly"
\header {
  title = "This is a test"
}\score {
  {
    \displayMusic { \tuplet 3/2 { d8( d d) } }
  }
}