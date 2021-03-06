use 5.008001; use strict; use warnings; use utf8;

use lib 'inc';
use ExtUtils::MakeMaker;
use Inline::Module;

WriteMakefile(
  NAME => 'Alt::Acme::Math::XS::External',
  VERSION => '0.0.2',
  ABSTRACT => 'Math is HARD (faster!)',
  AUTHOR => 'Ingy döt Net <ingy@cpan.org>',
  LICENSE => 'perl',
  MIN_PERL_VERSION => '5.008001',
  test => { TESTS => 't/*.t' },
  postamble => {
    inline => {
      module => 'Acme::Math::XS',
      makestub => 1,
    },
  },
  META_MERGE => {
    'meta-spec' => { version => 2 },
    prereqs => {
        develop => {
          requires => {
            'Inline::C' => '0.68',
            'Inline::Module' => '0.30',
        },
      },
    },
    no_index => {
      directory => [
        'inc',
        'lib/Acme',
      ],
    },
  },
);
