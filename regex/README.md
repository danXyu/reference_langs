# Regex Essentials - Dan Yu

This document will contain the necessary information for basic regex parsing. The functions have been tested
using javascript's 'replace' and 'match' functions along with Node's V8 javascript engine. Please open the
essentials.js file in order to see the bare foundation for regular expressions.

***

## Character Classes:
c = Control character
s = White space
S = Not white space
d = Digit
D = Not digit
w = Word
W = Not word
O = Octal digit
x = Hex Char

## Anchor Tags:
^, Start of string, or start of line in multi-line pattern
\A, Start of string
$, End of string, or end of line in multi-line pattern
\Z, End of string
\b, Word boundary
\B, Not word boundary
\<, Start of word
\>, End of word

## Assertions:
?=,  Lookahead assertion
?!,  Negative lookahead
?<=,  Lookbehind assertion
?!= or ?<!,  Negative lookbehind
?>,  Once-only Subexp­ression
?(),  Condition [if then]
?()|,  Condition [if then else]
?#,  Comment