/**
 * This document will include the code necessary to parse through certain strings using regex to delimit
 * certain pieces of text. As regex is an essential part of most programs and especially for work on web
 * servers with URLs, this document will eventually prove invaluable. The document is split into sections
 * that focus on a specific aspect of the regex language.
 */

/* Character Classes. */
// c, Control character
// s, White space
// S, Not white space
// d, Digit
// D, Not digit
// w, Word
// W, Not word
// O, Octal digit
// x, Hex Char

/* Anchor Tags. */
// ^, Start of string, or start of line in multi-line pattern
// \A, Start of string
// $, End of string, or end of line in multi-line pattern
// \Z, End of string
// \b, Word boundary
// \B, Not word boundary
// \<, Start of word
// \>, End of word


// Match the first matched word, a super basic task of finding its first occurrence.
var string_ex_1 = "hello, i'm testING something";
var matches = string_ex_1.match(/ing/);
// console.log(matches);
// Output: [ 'ing', index: 25]


// Replace the pattern formed for lone word "hi" with "hello". Use \b for word boundaries.
var string_ex_2 = "hi world, it's great to have big thighs";
var new_string_ex_2 = string_ex_2.replace(/\bhi\b/, "hello");
// console.log(new_string_ex_2);
// Output: hello world, it's great to have big thighs


// Replace by matching for multiple occurrences of a pattern using "+". Hint: Use g to search all instances.
var string_ex_3 = "helloooo, what is that order of ooperations again oh nooo";
var new_string_ex_3 = string_ex_3.replace(/o+/g, "o");
// console.log(new_string_ex_3);
// Output: hello, what is that order of operations again oh no


// Replace by matching for one or more "a"s and zero or more "!"s.
var string_ex_4 = "The sheep goes 'baaaaa!' but doesn't stop going 'baaaa'";
var new_string_ex_4 = string_ex_4.replace(/b(a+)(!*)/g, "baa!");
// console.log(new_string_ex_4);
// Output: The sheep goes 'baa!' but doesn't stop going 'baa!'


// Replace the numbers with 6 zeros into "million," using curly brace matching.
var string_ex_5 = "1000 \n20000 \n50 \n1000000 \n67000000 \n8500";
var new_string_ex_5 = string_ex_5.replace(/(0{6})/g, " million");
console.log(new_string_ex_5);

