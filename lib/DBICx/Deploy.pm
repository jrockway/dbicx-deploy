package DBICx::Deploy;
use strict;
use warnings;
use Carp;

our $VERSION = '0.01';

sub deploy {
    my ($class, $schema, $dsn) = @_;
    croak 'need schema' unless $schema;
    croak 'need dsn' unless $dsn;
    
    eval "use $schema" or die "Failed to use $schema: $@";
    $schema->connect($dsn);
    $schema->deploy;
}

1;

__END__

=head1 NAME

DBICx::Deploy - deploy a DBIx::Class schema

=head1 SYNOPSIS

   use DBIx::Class;
   DBICx::Deploy->deploy('My::Schema' => 'DBI:SQLite:root/database');

or

   $ dbicdeploy -Ilib My::Schema DBI:SQLite:root/database

=head1 METHODS

=head2 deploy($schema, $dsn)

Load the DBIC schema C<$schema>, connect to C<$dsn>, and deploy the
schema.  Dies on failure.

=head1 AUTHOR

Jonathan Rockway C<< <jrockway@cpan.org> >>

=head1 LICENSE

This program is free software.  You may redistribute it under the same
terms as Perl itself.
