[![Actions Status](https://github.com/lizmat/Attribute-Predicate/workflows/test/badge.svg)](https://github.com/lizmat/Attribute-Predicate/actions)

NAME
====

Attribute::Predicate - add "is predicate" trait to Attributes

SYNOPSIS
========

```raku
use Attribute::Predicate;

class Foo {
    has $.bar is predicate;         # adds method "has-bar"
    has $.baz is predicate<bazzy>;  # adds method "bazzy"
}

Foo.new(bar => 42).has-bar;    # True
Foo.new(bar => 42).bazzy;      # False
```

DESCRIPTION
===========

This module adds a `is predicate` trait to `Attributes`. It is similar in function to the "predicate" option of Perl's `Moo` and `Moose` object systems.

If specified without any additional information, it will create a method with the name "has-{attribute.name}". If a specific string is specified, then it will create the method with that given name.

The method in question will return a `Bool` indicating whether the attribute has a defined value.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Attribute-Predicate . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2019, 2021, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

