% Scales for Cello
\version "2.18.2"
\language "english"
% Use these and \displayLilyMusic to generate scales
scaleAsc = {
  c d e f g a b
}
scaleDsc = {
  c b a g f e d
}
threeOctave = {
  c d e \scaleAsc \scaleAsc \scaleAsc \scaleDsc \scaleDsc \scaleDsc c d c
}
twoOctave = {
  c d e \scaleAsc \scaleAsc \scaleDsc \scaleDsc c
}
cMajorThreeOctave = {
  \key c \major
  \clef "bass"  
  c, d, e, c, d, e, f, g, 
  a, b, c d e f g a
  b c' d' e' 
  \clef "tenor"  
  f' g' a' b'
  c'' b' a' g' f' e' d' c' 
  \clef "bass"  
  b a g f e d c b, 
  a, g, f, e, d, c, d, c,
}

dMajorThreeOctave = {
  \key d \major
  \clef "bass"
  d,-1 e,-2 fsharp,-4 d, 
  e, fsharp, g, a, 
  b, csharp d e 
  fsharp g a b 
  \clef "tenor" 
  csharp' d' e' fsharp' 
  g' a' b' csharp''
  d'' csharp'' b' a' 
  g' fsharp' e' d' 
  \clef "bass" 
  csharp' b a g 
  fsharp e d csharp 
  b, a, g, fsharp, 
  e, d, e, d,
}
