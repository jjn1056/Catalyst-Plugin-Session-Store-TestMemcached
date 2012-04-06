#!/usr/bin/env perl

use FindBin;
use Test::Most;
use HTTP::Request::Common;

use lib "$FindBin::Bin/lib";
use Catalyst::Test 'TestApp';

ok my($res, $c) = ctx_request('/');

{
  ok my $response = request GET $c->uri_for_action('/welcome'),
    'got welcome from a catalyst controller';

  is $response->content, 'Welcome to Catalyst: 1',
    'expected content body';
}

{
  ok my $response = request GET $c->uri_for_action('/welcome'),
    'got welcome from a catalyst controller';

  is $response->content, 'Welcome to Catalyst: 2',
    'expected content body';
}

done_testing;
