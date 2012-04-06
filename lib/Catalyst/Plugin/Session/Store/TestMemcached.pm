package Catalyst::Plugin::Session::Store::TestMemcached;

use Moose;
use namespace::autoclean;
use Test::Memcached;

extends 'Catalyst::Plugin::Session::Store::Memcached';

(my $memd = Test::Memcached->new)
  ->start;

before 'setup_session', sub {
  (my $self = shift)
    ->_session_plugin_config
    ->{__test_memcached} = $memd;

  $self->_session_plugin_config
    ->{memcached_new_args}
    ->{data} = "127.0.0.1:${\$memd->option('tcp_port')}"
}

__PACKAGE__->meta->make_immutable;
