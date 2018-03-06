package App::LocaleCodesUtils;

# DATE
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
        my @codes = Locale::Country::all_country_codes();
        my @data;
        for (@codes) {
            push @data, [$_, Locale::Country::code2country($_)];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of countries',
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
die "Can't generate list_countries(): $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'list_languages',
    summary => 'List languages',
    table_data => sub {
        require Locale::Language;
        my @codes = Locale::Language::all_language_codes();
        my @data;
        for (@codes) {
            push @data, [$_, Locale::Language::code2language($_)];
        }
        return { data=>\@data };
    },
    table_spec => {
        summary => 'List of languages',
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
die "Can't generate list_languages(): $res->[0] - $res->[1]" unless $res->[0] == 200;

1;
#ABSTRACT: Utilities related to locale codes

=for Pod::Coverage ^(.+)$

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<Locale::Codes>

=cut
