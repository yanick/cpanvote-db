use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'cpanvote::Schema',
    license             => 'perl',
    dist_author         => 'Yanick Champoux <yanick@cpan.org>',
    dist_version_from   => 'lib/cpanvote/Schema.pm',
    requires => {
        map { $_ => 0 } qw/
            DBIx::Class::TimeStamp
            DBIx::Class::Candy
            DateTime::Format::Pg
            DBIx::Class::DeploymentHandler
            DBD::Pg
        /,
    },
);

$builder->create_build_script();
