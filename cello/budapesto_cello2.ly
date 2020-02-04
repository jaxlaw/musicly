% LilyBin
\version "2.18.2"
\header {
	title = "Budapesto"
	subtitle = "cello 2"
	composer = "Carey Cheney"
}
\score{
	\new Staff {
		\clef "bass"
		\key d \minor
		\numericTimeSignature \time 4/4
		\relative d, {
			d8-.[ r d-.] r d-.[ r d-.] r |
			d-.[ r d-.] r d-.[ r d-.] r |
			d'[ r a] r d[ r a] r |
			g[ r d'] r d[ r a] r |
			a[ r e] r d[ r d] r | \break
			a'4-. g-. f-. e-. |
			d8[ r a'] r d[ r a] r |
			g[ r d'] r d[ r a] r |
			e'[ r a] r e[ r a] r |
			a,[ g] f[ e] d r d' r_"Fine" \bar "|." |
			<d a'>1 <d a'> <d a'> <d a'> | %m11-15
			<d a'> <d a'> <d a'> |  %m15-17
			a8[ g] f[ e] d r d' r |
			d[ r a] r d[ r a] r |
			a[ r e] r a[ r e] r |
			d[ r a'] r d,[ r a'] r |
			a[ r e] r a[ r e] r |
			d[ r a'] r d,[ r a'] r |
			a[ r e] r a[ r e] r |
			a[ r e] r a g f e|
			e[ r a] r d r^"D.C. al Fine"_"2nd time faster"
			\bar "||"
		}
	}
	\layout {}
	\midi{}
}
