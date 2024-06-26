multi sub trait_mod:<is>(Attribute:D \attr, :$predicate!) is export {
    if $predicate {
        my $name := $predicate ~~ Bool
          ?? "has-{attr.name.substr(2)}"
          !! $predicate.Str;
        my $method := method { attr.get_value(self).defined }
        $method.set_name($name);
        attr.package.^add_method($name,$method)
    }
}

=begin pod

=head1 NAME

Attribute::Predicate - add "is predicate" trait to Attributes

=head1 SYNOPSIS

=begin code :lang<raku>

use Attribute::Predicate;

class Foo {
    has $.bar is predicate;         # adds method "has-bar"
    has $.baz is predicate<bazzy>;  # adds method "bazzy"
}

Foo.new(bar => 42).has-bar;    # True
Foo.new(bar => 42).bazzy;      # False

=end code

=head1 DESCRIPTION

This module adds a C<is predicate> trait to C<Attributes>.  It is similar
in function to the "predicate" option of Perl's C<Moo> and C<Moose> object
systems.

If specified without any additional information, it will create a method
with the name "has-{attribute.name}".  If a specific string is specified,
then it will create the method with that given name.

The method in question will return a C<Bool> indicating whether the attribute
has a defined value.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Attribute-Predicate .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2019, 2021, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
