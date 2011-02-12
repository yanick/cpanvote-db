#!/usr/bin/env perl

use strict;
use warnings;
use aliased 'DBIx::Class::DeploymentHandler' => 'DH';
use FindBin;
use lib "$FindBin::Bin/../lib";
use cpanvote::Schema;

my $schema = cpanvote::Schema->connect('dbi:Pg:database=cpanvote',);

my $dh = DH->new({
    schema              => $schema,
    script_directory    => "$FindBin::Bin/sql",
    databases           => 'SQLite',
    sql_translator_args => { add_drop_table => 0 },
});

#$dh->prepare_install;
$dh->install;
