# Jade Personal Reference Sheet (100%)

This reference sheet is intended as a quick reference for whenever the jade language is used for programming projects. It's
not too comprenhensive but it covers the basics of the language. Whenever a user needs to input certain elements with the
least amount of work, then jade is the way to go. This personal documentation sheet will cover the use of mixins in jade,
variables, loops, and how jade is very similar to ruby in many ways.

***

### Attributes

Attributes can be added to an HTML element in many ways. You can either include them directly within parenthesis or you can attach an attributes object which will assign the key-value pairs to be that element's attributes.

### Variables

Inserting javascript code into jade requires the use of "-" before the code, as well as special use cases for buffered ("=" prepend)
and unbuffered code ("!=" prepend). This will then be rendered by the browser.

### Mixins

Arguably the strongest point for using jade. Mixins allow for piece of code to become "reusable," in the sense that you can call the
mixin using "+" and then insert that jade code into your document.