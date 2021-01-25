#!/bin/bash

# Install perl-5.32.0 to be used with git

# https://perlmaven.com/how-to-build-perl-from-source-code

# ISSUES: When there is accent in the source path, Archive-TAR does not compile.
# FUTURE: Maybe use the flag for bif files

wget "https://github.com/Perl/perl5/archive/v5.32.0.zip"
unzip v5.32.0.zip
cd perl5-5.32.0/

./Configure -des -Dprefix=/opt/apps/perl/5.32.0/ -Dusethreads
make -j 8
TEST_JOBS=8 make test_harness
sudo make install