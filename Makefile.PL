use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'           => 'File::Lock',
    'VERSION_FROM'   => 'Lock.pm', # finds $VERSION
    'PREREQ_PM'      => {},
    ($] >= 5.005 ?
      (ABSTRACT_FROM => 'Lock.pm',
       AUTHOR        => 'Jeremy Kister <http://jeremy.kister.net/>') : ()),
);
