#!/usr/bin/perl

package Crypt::Random::Source::SSLeay;
use Squirrel;

extends qw(Crypt::Random::Source::Base);

use Net::SSLeay ();

sub rank { 200 }

sub available { 1 }

sub seed {
	# RAND_add is documented but not implemented
	#my ( $self, @stuff ) = @_;
	#NET::SSLeay::RAND_add($_, length, 0) for @stuff;
}

__END__

=pod

=head1 NAME

Crypt::Random::Source::SSLeay - L<Net::SSLeay> support for
L<Crypt::Random::Source>

=head1 SYNOPSIS

	use Crypt::Random::Source::Strong::SSLeay;

	my $src = Crypt::Random::Source::Strong::SSLeay->new;

	my $random = $src->get(1024);

=head1 DESCRIPTION

This module implements L<Net::SSLeay> based random number generation for
L<Crypt::Random::Source>.

L<Net::SSLeay> does not wrap the SSL api, and C<RAND_bytes> is documented as
being cryptographically strong, so L<Crypt::Random::Source::Strong::SSLeay> is
also provided (as opposed to the other OpenSSL based sources).

=head1 METHODS

=over 4

=item get

Get 10 random or pseudorandom bytes (depending on strength) from
L<Net::SSLeay>.

=item seed

Currently unimplemented, but L<Net::SSLeay> documents C<RAND_add>. Might be
added in the future.

=back

=cut


