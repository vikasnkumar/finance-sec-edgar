use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    module_name => 'Finance::SEC::Edgar',
    license => 'perl',
    dist_author => 'Vikas N. Kumar <vikas@cpan.org>',
    dist_abstract => 'Finance::SEC::Edgar provides downloads of SEC EDGAR filings',
    dist_version_from => 'lib/Edgar.pm',
    create_readme => 0,
    create_license => (-e 'LICENSE' ? 0 : 1),
    configure_requires => {
        'Module::Build' => 0,
        'Software::License' => 0,
    },
    build_requires => {
        'Module::Build' => 0,
        'Test::More' => 0,
        'File::Spec' => 0,
        'LWP' => 0,
        'LWP::UserAgent' => 0,
    },
    requires => {
        'perl' => '5.10.0',
        'LWP' => 0,
        'DateTime' => 0,
    },
    recommends => {
        'Finance::QuoteHist' => 0,
        'PGPLOT' => 0,
    },
    share_dir => {
        dist => [qw/examples/],
    },
    dynamic_config => 1,
    add_to_cleanup => [ qw/*.bak _Inline/ ],
    meta_merge => {
        resources => {
            repository => "https://github.com/vikasnkumar/finance-sec-edgar",
            bugtracker => "https://github.com/vikasnkumar/finance-sec-edgar/issues",
        },
        keywords => [qw/ finance SEC Edgar filings securities companies/],
        no_index => {
            directory => [qw/ t /],
        },
    },
    pm_files => {
        'lib/Edgar.pm' => 'lib/Finance/SEC/Edgar.pm',
    }
);

$build->create_build_script;
$build->dispatch('distmeta');
$build->dispatch('manifest');

__END__
#### COPYRIGHT: 2014. Vikas N Kumar. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 13th Jan 2014
#### LICENSE: Refer LICENSE file.
