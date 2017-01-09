package Dist::Zilla::Plugin::Meta::Maintainers;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.01';

use Moose;

has maintainer => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    default => sub { [] },
);

with 'Dist::Zilla::Role::MetaProvider';

sub mvp_multivalue_args {'maintainer'}

sub metadata {
    my $self = shift;
    if ( @{ $self->maintainer } ) {
        return { x_maintainers => $self->maintainer };
    }
    else {
        return {};
    }
}

__PACKAGE__->meta->make_immutable;

1;

# ABSTRACT: Generate an x_maintainers section in distribution metadata

__END__

=pod

=encoding UTF-8

=head1 SYNOPSIS

  [Meta::Maintainers]
  maintainer = Dave Rolsky <autarch@urth.org>
  maintainer = Jane Schmane <jschmane@example.com>

=head1 DESCRIPTION

This plugin adds an C<x_maintainers> key in the distribution's metadata. This
will end up in the F<META.json> and F<META.yml> files, and may also be useful
for things like L<Pod::Weaver> plugins.

=cut
