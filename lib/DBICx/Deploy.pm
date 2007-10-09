package DBICx::Deploy;
use strict;
use warnings;
use Carp;

our $VERSION = '0.02';

sub deploy {
    my ($class, $schema_class, $dsn, @args) = @_;
    croak 'need schema' unless $schema_class;
    croak 'need dsn' unless $dsn;
    
    eval "require $schema_class" or die "Failed to use $schema_class: $@";
    my $schema = $schema_class->connect($dsn, @args);
    $schema->deploy;
}

1;

__END__

=head1 NAME

DBICx::Deploy - deploy a DBIx::Class schema

=head1 SYNOPSIS

   use DBICx::Deploy;
   DBICx::Deploy->deploy('My::Schema' => 'DBI:SQLite:root/database');

or

   $ dbicdeploy -Ilib My::Schema DBI:SQLite:root/database

=head1 METHODS

=head2 deploy($schema, $dsn, @args)

Loads the DBIC schema C<$schema>, connects to C<$dsn> (with extra args
C<@args> like username, password, and options), and deploys the
schema.  Dies on failure.

=head1 AUTHOR

Jonathan Rockway C<< <jrockway@cpan.org> >>

=head1 CONTRIBUTORS

The following people have contributed code or bug reports:

=over 4

=item Brian Cassidy

=item Andreas Marienborg

=item Pedro Melo

=back

Thanks!

=head1 LICENSE

This program is free software.  You may redistribute it under the same
terms as Perl itself.
