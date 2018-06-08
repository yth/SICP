# Summary

In chapter 1 of the SICP, the authors managed to fit in an introduction to
programming, an introduction to scheme, and an introduction to programming
languages centered around the idea of black-box abstraction. For good measure,
one could also learn a reasonably hefty dose of mathematics along the way.

The fundamental ideas to keep in mind are that of primitives, combination, and
abstraction.

## Introduction to Programming

In some ways, programming is about making recipies, to use a old metaphor.
Recipies would be a way to pass on instruction on how to make something. There
are standard ways on formulating a recipy, and there are intricacies on writing
down a recipy.

Leaving off the idea of ingredients, the way to describe the procedure to make
something from a recipy requires a way to express the ideas of primitive
operations, conditionals, and and loops. Both recursive and iterative processes
are explored for looping.

## Introduction to Scheme

This chapters shows some of Scheme's primitive operations, and Scheme's notation
on how to express conditionals, and loops. Most importantly, it shows how Scheme
can combine primitive operations (simple expressions) into compound expressions.

## Introduction to Programming Languages

In addition to introducing Scheme's notation, the reader is also introduced to
the idea of evaluating the notation, and the consequences of different ways of
evaluating the same procedure.

The simple substitution model for evaluation was introduced. As the consequence,
the two different orders of evaluations was also described: applicative order,
and normative order.

Scheme was shown to be an applicative order language. However, the evaluation
order for certain operations needs to be changed. As the result, the topic of
special forms was developed.

## Black-Box Abstraction

After the idea of a procedure is established, it's natural to want to do more
with procedures-combine them into more complex procedures, reason about problems
in terms of higher order procedures, and make effective procedures at every
level.

To teach about making better procedures, the idea of efficiency was developed,
and big-O notation was introduced.

To make more complex procedures and higher order procedures, the idea of
abstraction must first be explained. The problems of names, scoping and
environment was briefly explored. Ultimately, certain procedures can treated as
black-boxes where only the information about its input and output are needed.
These procedures can be used simply by invoking their name.

To make maximal use of black-box abstraction, we would want to use these
black-box procedures as building blocks for other procedures, we would want to
build these black-box procedures from procedures that we define, and we would
want to use the black-box procedures generated from our procedures as building
blocks in yet more procedures.

To make it all possible, there are implications on what the underlying machinery
must be capable of. A more and more complete picture will emerge as the book
processes further.
