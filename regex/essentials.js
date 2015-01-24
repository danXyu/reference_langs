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
var matches_ex_1 = string_ex_1.match(/ing/);
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
// console.log(new_string_ex_5);


// Find and replace multiple whitespace characters at the start of a line.
var string_ex_6 = "  lalala lululu, these whitespace \n   will be deleted";
var new_string_ex_6 = string_ex_6.replace(/(\s){2,}/g, " ").replace(/^ +/g, "");
// console.log(new_string_ex_6);


// Replace using brackets to specify characters that can be prepended.
var string_ex_7 = "There is a dog with a bog and a cog to follow";
var new_string_ex_7 = string_ex_7.replace(/[dbc]og/g, "dog");
// console.log(new_string_ex_7);
// Output: There is a dog with a dog and a dog to follow


// Replace by combining the use of brackets with hyphens to delineate ranges.
var string_ex_8 = "This will select dan for dkn to be duned into";
var new_string_ex_8 = string_ex_8.replace(/d([a-u])n/g, "dan");
// console.log(new_string_ex_8);
// Output: This will select dan for dan to be daned into


// Replace the use of brackets inside a string by escaping the brackets.
var string_ex_9 = "The panda (Ailuropoda melanoleuca, lit. “black and white cat-foot”)[2]";
var new_string_ex_9 = string_ex_9.replace(/\[\d+\]/, "");
// console.log(new_string_ex_9);
// Output: The panda (Ailuropoda melanoleuca, lit. “black and white cat-foot”)


/*jslint regexp: true*/
// Replace the commas and dollar signs but with the use of negative character sets.
var string_ex_10 = "$1,200.00 $5,600.25 $100.09 $42,100.01";
var new_string_ex_10 = string_ex_10.replace(/[^\d. ]/g, "");
// console.log(new_string_ex_10);
// Output: 1200.00 5600.25 100.09 42100.01
/*jslint regexp: false*/


// Replace parts of a string by making use of $ variables and parenthesis.
var string_ex_11 = "1/3/2012, 1/5/2012, 2/5/2012, 4/5/2012, 6/22/2013";
var new_string_ex_11 = string_ex_11.replace(/(\d+\/\d+)\/2012/g, "$1/2013");
// console.log(new_string_ex_11);
// Output: 1/3/2013, 1/5/2013, 2/5/2013, 4/5/2013, 6/22/2013


/*jslint regexp: true*/
// Make use of negative character sets to get the proper parameters for string substitution.
var string_ex_11 = '"What in the world?" Mary asked. \n"Hello!" James yelled. \n"Goodbye!" Mary responded.';
var new_string_ex_11 = string_ex_11.replace(/"([^"]+)" ([^.]+)\./g, "$2: $1");
// console.log(new_string_ex_11);
// Output: Mary asked: What in the world? "Hello!" James yelled. "Goodbye!" Mary responded.
/*jslint regexp: false*/


// Use the "?" optionality operator to designate that the character can or cannot exist.
var string_ex_12 = "1-555-402-9800 \n(555)-951-8341";
var matches_ex_12 = string_ex_12.match(/1?-?\(?\d{3}\)?-?\d{3}-?\d{4}/g);
// console.log(matches_ex_12);
// Output: [ '1-555-402-9800', '(555)-951-8341' ]


// Also remember, you can make a regex non-capturing by prepending "?:" to the start of the parens.
var string_ex_13 = "$200 $19.20 $610.42 $1.5 $15";
var new_string_ex_13 = string_ex_13.replace(/\$(\d+)(?:\.\d{1,2})?/g, "$1 $2");
// console.log(new_string_ex_13);
// Output: 200 $2 19 $2 610 $2 1 $2 15 $2
// Notice: How the "$2" string literal is actually printed because the regex is non-capturing.


/*jslint regexp: true*/
// An important part of the regex language is laziness (dictated by "+?") and greediness.
var string_ex_14 = 'When the sheep says "Cowabunga!", the cow will reply, "Baa! Baa!"';
var new_string_ex_14 = string_ex_14.replace(/".+?"/, "Cow!");
// console.log(new_string_ex_14);
// Output: When the sheep says Cow!, the cow will reply, "Baa! Baa!"
/*jslint regexp: false*/


// The use of lookaheads is also quite prominent to only capture the necessary sections of texts.
var string_ex_15 = "1,000 dachshunds, of the brown-colored variety, ran 12,000 laps.";
var new_string_ex_15 = string_ex_15.replace(/,(?=\d+)/g, "");
// console.log(new_string_ex_15);
// Output: 1000 dachshunds, of the brown-colored variety, ran 12000 laps.


/* Quick summary of lookaheads and lookbehinds. */
// !=, negative lookahead
// ?<=, lookbehind
// ?<!, negative lookbehind


// This is a specific use of a negative lookbehind that I thought was important. But < isn't right for js.
var string_ex_16 = "Charles spent 20.5 at the chatusserie. He then withdrew 40.5 from the ATM.";
var new_string_ex_16 = string_ex_16.replace(/(?:!\d)\./g, ",");
// console.log(new_string_ex_16);


// This is a quick use for matching regex to a phone number using char sets.
var string_ex_17 = "555-241-5010 \n555 981 2705";
var matches_ex_17 = string_ex_17.match(/(\d{3})[ \-]?(\d{3})[ \-]?(\d{4})/g);
// console.log(matches_ex_17);
// Output: [ '555-241-5010', '555 981 2705' ]


/* Regex Essentials. */
// Matching a username: /^[a-z0-9_-]{3,16}$/
// Matching a password: /^[a-z0-9_-]{6,18}$/
// Matching a hex: /^#?([a-f0-9]{6}|[a-f0-9]{3})$/
// Matching a slug: /^[a-z0-9-]+$/
// Matching an email: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
// Matching a URL: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
// Matching an IP Address: /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
// Matching an HTML tag: /^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$/