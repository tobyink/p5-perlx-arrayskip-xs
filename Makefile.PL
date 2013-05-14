use 5.008000;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME              => 'PerlX::ArraySkip::XS',
	VERSION_FROM      => 'lib/PerlX/ArraySkip/XS.pm',
	PREREQ_PM         => {},
	ABSTRACT_FROM     => 'lib/PerlX/ArraySkip/XS.pm',
	AUTHOR            => 'Toby Inkster <tobyink@cpan.org>',
	LIBS              => [''],
	DEFINE            => '',
	INC               => '-I.',
);

if  (eval {require ExtUtils::Constant; 1}) {
  # If you edit these definitions to change the constants used by this module,
  # you will need to use the generated const-c.inc and const-xs.inc
  # files to replace their "fallback" counterparts before distributing your
  # changes.
  my @names = (qw());
  ExtUtils::Constant::WriteConstants(
                                     NAME         => 'PerlX::ArraySkip::XS',
                                     NAMES        => \@names,
                                     DEFAULT_TYPE => 'IV',
                                     C_FILE       => 'const-c.inc',
                                     XS_FILE      => 'const-xs.inc',
                                  );

}
else {
  use File::Copy;
  use File::Spec;
  foreach my $file ('const-c.inc', 'const-xs.inc') {
    my $fallback = File::Spec->catfile('fallback', $file);
    copy ($fallback, $file) or die "Can't copy $fallback to $file: $!";
  }
}
