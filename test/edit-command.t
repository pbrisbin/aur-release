  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH
  > _aur_release() { aur-release -y -n "$@"; }

Exits if the command fails

  $ _aur_release -c false package
  Releasing * (glob)
  Releasing * (glob)
  git clone * (glob)
  Launching false in AUR package repo
  false returned non-zero
  [1]

Supports multi-word commands

  $ _aur_release -c 'echo hi' package
  Releasing * (glob)
  Releasing * (glob)
  git clone * (glob)
  Launching echo hi in AUR package repo
  hi
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push
