package TestApp::Controller::Root;

use Moose;
use MooseX::MethodAttributes;

extends 'Catalyst::Controller';

sub default : Path { }
sub welcome : Path(welcome) {
  my ($self, $ctx) = @_;
  my $count = $ctx->session->{count}++;
  $ctx->session(count => $count)
  pop->res->body('Welcome to Catalyst: $count');
}

__PACKAGE__->meta->make_immutable;

