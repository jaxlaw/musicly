\version "2.18.2"
\include "scale_gen.ly"
\include "scales.ly"
\header {
  title = "This is a test"
}\score {
  {
    %\displayMusic \RepeatFlatten 9 { \tuplet 3/2 { d8( d d) } }
    \displayMusic \ApplyPatterns { \tuplet 3/2 { d8 d d } } {d( d d)} {a b c d e f g g g}
  }
}