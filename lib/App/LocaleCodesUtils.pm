package App::LocaleCodesUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Perinci::Sub::Gen::AccessTable qw(gen_read_table_func);

my $res;

$res = gen_read_table_func(
    name => 'list_currencies',
    summary => 'List currencies',
    table_data => sub {
        require Locale::Currency;
        my @codes = Locale::Currency::all_currency_codes();
        my @data;
        for (@codes) {
            push @data, [$_, Locale::Currency::code2currency($_)];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of currencies',
        fields => {
            code => {
                schema => 'str*',
                pos => 0,
                sortable => 1,
            },
            name => {
                schema => 'str*',
                pos => 1,
                sortable => 1,
            },
        },
        pk => 'code',
    },
);
die "Can't generate list_currencies(): $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'list_countries',
    summary => 'List countries',
    table_data => sub {
        require Locale::Country;
        my @alpha2s = Locale::Country::all_country_codes('alpha-2');
        my @data;
        for my $alpha2 (@alpha2s) {
            my $country = Locale::Country::code2country($alpha2, 'alpha-2');
            my $alpha3  = Locale::Country::country2code($country, 'alpha-3');
            push @data, [$alpha2, $country, $alpha3];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of countries',
        fields => {
            alpha2 => {
                schema => 'str*',
                pos => 0,
                sortable => 1,
            },
            name => {
                schema => 'str*',
                pos => 1,
                sortable => 1,
            },
            alpha3 => {
                schema => 'str*',
                pos => 2,
                sortable => 1,
            },
        },
        pk => 'alpha2',
    },
);
die "Can't generate list_countries(): $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'list_languages',
    summary => 'List languages',
    table_data => sub {
        require Locale::Language;
        my @alpha2s = Locale::Language::all_language_codes('alpha-2');
        my @data;
        for my $alpha2 (@alpha2s) {
            my $lang   = Locale::Language::code2language($alpha2, 'alpha-2');
            my $alpha3 = Locale::Language::language2code($lang, 'alpha-3');
            push @data, [$alpha2, $lang, $alpha3];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of languages',
        fields => {
            alpha2 => {
                schema => 'str*',
                pos => 0,
                sortable => 1,
            },
            name => {
                schema => 'str*',
                pos => 1,
                sortable => 1,
            },
            alpha3 => {
                schema => 'str*',
                pos => 2,
                sortable => 1,
            },
        },
        pk => 'alpha2',
    },
);
die "Can't generate list_languages(): $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'list_scripts',
    summary => 'List scripts',
    table_data => sub {
        require Locale::Script;
        my @codes = Locale::Script::all_script_codes();
        my @data;
        for (@codes) {
            push @data, [$_, Locale::Script::code2script($_)];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of scripts',
        fields => {
            code => {
                schema => 'str*',
                pos => 0,
                sortable => 1,
            },
            name => {
                schema => 'str*',
                pos => 1,
                sortable => 1,
            },
        },
        pk => 'code',
    },
);
die "Can't generate list_scripts(): $res->[0] - $res->[1]" unless $res->[0] == 200;

1;
#ABSTRACT: Utilities related to locale codes

=for Pod::Coverage ^(.+)$

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<Locale::Codes>

=cut
