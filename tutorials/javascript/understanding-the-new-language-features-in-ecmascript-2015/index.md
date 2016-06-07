---
layout: post
title: Understanding the new language features in ECMAScript 2015
---

In this tutorial, we will be taking a look at the new features introduced in
the sixth edition of the JavaScript language.

1. [Arrow functions](01-arrow-functions)
2. [Binary and Octal Literals](02-binary-and-octal-literals)
3. [Block Bindings](03-block-bindings)
4. [Classes](04-classes)
5. [Default Parameters](05-default-parameters)
6. [Destructuring Assignments](06-destructuring-assignments)
7. [For Of](07-for-of)
8. [Generators](08-generators)
9. [Iterators](09-iterators)
10. [Method Definition Shorthands](10-method-definition-shorthands)
11. [Property Value Shorthands](11-property-value-shorthands)
12. [Rest Parameters](12-rest-parameters)
13. [Spread Operator](13-spread-operator)
14. [Template Strings](14-template-strings)
15. [Modules](15-modules)
16. [Conclusion](16-conclusion)

This edition of JavaScript introduces a lot of new language syntax features, it
might even be the most feature packed revision to date in terms of language
additions, and that is with some of the features scheduled, like
comprehensions, rest and spread properties being delayed to the next edition.

Another thing to keep in mind is that these features are also designed to be
backwards compatible when possible, in the sense that they are mostly syntactic
sugar and can be desugared to older versions of the language. For us as users
this means we can use them even with runtimes that do not support them yet,
provided that we compile it down with a source to source compiler.
