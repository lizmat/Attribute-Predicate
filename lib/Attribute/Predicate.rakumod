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

# vim: expandtab shiftwidth=4
