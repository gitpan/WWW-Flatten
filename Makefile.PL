use strict;
use warnings;
use ExtUtils::MakeMaker;

my %params = (
    NAME          => 'WWW-Flatten',
    AUTHOR        => 'sugama <sugama@jamadam.com>',
    VERSION_FROM  => 'lib/WWW/Flatten.pm',
    ABSTRACT_FROM => 'lib/WWW/Flatten.pm',
    LICENSE       => 'perl',
    PREREQ_PM     => {
        'Mojolicious' => '5.41',
        'WWW::Crawler::Mojo' => '0.05',
    },
    BUILD_REQUIRES => {
        'Test::More'            => '0.98',
        'Test::UseAllModules'   => '0.10',
    },
    META_MERGE => {
        resources => {
            repository => '',
        },
    },
    test => {TESTS => 't/*.t t/*/*.t'},
    EXE_FILES => ['example/wwwflatten'],
);

my $eumm = $ExtUtils::MakeMaker::VERSION;
delete $params{LICENSE}          if $eumm < 6.31;
delete $params{MIN_PERL_VERSION} if $eumm < 6.48;
delete $params{META_MERGE}       if $eumm < 6.46;
delete $params{META_ADD}         if $eumm < 6.46;
delete $params{LICENSE}          if $eumm < 6.31;

if ($eumm < 6.52 && $params{CONFIGURE_REQUIRES}) {
    $params{PREREQ_PM} = {
        %{ $params{PREREQ_PM}          || {} },
        %{ $params{CONFIGURE_REQUIRES} },
    };
    delete $params{CONFIGURE_REQUIRES};
}
if ($eumm < 6.5503 && $params{BUILD_REQUIRES}) {
    $params{PREREQ_PM} = {
        %{ $params{PREREQ_PM}      || {} },
        %{ $params{BUILD_REQUIRES} },
    };
    delete $params{BUILD_REQUIRES};
}

WriteMakefile(%params);
