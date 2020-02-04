% LilyBin
\version "2.18.2"
\header {
        title = "Harmonic Warmup Variations"
        composer = "Jax Law"
}
\markup {
\italic "Basic warmup. Repeat with different fingerings for the non-harmonic notes C G and D."
}
\score{
        \new Staff {
      \clef "bass"
      \numericTimeSignature \time 4/4
      \relative c, {
        c1_"VI"-0^\markup {
           \right-align "Var 1"
        }
        c'\flageolet-3 c_"III"
        g-0 g'\flageolet-3 g_"II"
        d-0 d'\flageolet-3 d_"I"
        a-0 a'\flageolet-3 a,\harmonic_"II"-1
        d\flageolet-3 d,\harmonic_"III"-1
        g\flageolet-3 g,\harmonic_"IV"-1
        c\flageolet-3 c,-0 \bar "||" \break
      }
        }
        \layout {}
    \midi {}
}
\markup {
\italic "Exercise for 2nd and 4th positions. Use open strings to check for intonation."
}
\score {
        \new Staff {
      \clef "bass"
      \numericTimeSignature \time 4/4
      \relative c, {
        % VAR 2
        c2_"VI"-0^\markup{
           \right-align "Var 2"
        }
        c'\flageolet-3
        c_"III"-2 <c-2 c,-0> d-4 <d-4 d-0>
        g,-0 g'\flageolet-3 \break
        g_"II"-2 <g-2 g,-0> a-4 <a-4 a-0>
        d,-0 d'\flageolet-3
        d_"I"-2 <d-2 d,-0>
        a-0 a'\flageolet-3 \break
        a,\harmonic_"II"-1 a-1 <a-1 a-0>
        d,-0 d'\flageolet-3
        d,\harmonic_"III"-1 d-1 <d-1 d-0>
        g,-0 g'\flageolet-3
        g,\harmonic_"IV"-1 g-1 <g-1 g-0>
        c,-0 c'\flageolet-3 c,-0 \bar "||"
      }
    }
        \layout {}
    \midi {}
}


