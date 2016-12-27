  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH

It tags with version if needed

  $ aur-release v1.2.3 package
  Releasing package-1.2.3...
  git tag -s -m v1.2.3 v1.2.3
  git push --tags
  git clone ssh://aur@aur.archlinux.org/package /tmp/*/package (glob)
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git commit -m Release v1.2.3
  git push
