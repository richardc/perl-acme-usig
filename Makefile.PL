use ExtUtils::MakeMaker;
my $module = 'USIG.pm';
WriteMakefile(
              NAME         => 'Acme::USIG',
              VERSION_FROM => $module,
              PREREQ_PM    => {
                               'Test::More' => 0,
                              },
              AUTHOR       => 'Richard Clamp <richardc@unixbeard.net>',
              ABSTRACT     => 'Expresses an opinion on the strict pragma',
             );

use Config;
use File::Spec::Functions;
sub MY::postamble {
    my $perl     = $Config{perlpath};
    my $pod2text = catfile($Config{bin}, "pod2text");
    return <<EOF
README: $module
\t$perl $pod2text $module > README
EOF
}
