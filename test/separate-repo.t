  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH
  > _aur_release() { aur-release -y -n "$@"; }

With name and version

  $ _aur_release package v1.2.3
  Releasing package-v1.2.3
  Releasing in separate AUR repository
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Setting PKGBUILD version to v1.2.3
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit -m Release v1.2.3
  git push

With only name

  $ _aur_release -c true package
  Releasing package-unknown
  Releasing in separate AUR repository
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Launching true in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push

Without name or version

  $ _aur_release -c true
  Releasing separate-repo.t-unknown
  Releasing in separate AUR repository
  git clone ssh://aur@aur.archlinux.org/separate-repo.t /tmp/* (glob)
  Launching true in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push
