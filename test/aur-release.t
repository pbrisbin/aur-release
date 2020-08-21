  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH

It works for a name and version

  $ aur-release -y -n package v1.2.3
  Releasing v1.2.3 in AUR repository for package
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Setting PKGBUILD version to v1.2.3
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit -m Release v1.2.3
  git push

It releases the current directory on no name/version

  $ aur-release -y -n -e -C write-package
  Releasing this directory as an AUR repository for aur-release.t
  git remote add aur ssh://aur@aur.archlinux.org/aur-release.t
  git fetch aur
  git branch --set-upstream-to=aur/master
  Launching write-package in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push

It launches editor if no version

  $ aur-release -y -n -C true package
  Releasing new version in AUR repository for package
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Launching true in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push

It exits if the edit operation fails

  $ aur-release -y -n -C false package
  Releasing new version in AUR repository for package
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Launching false in AUR package repo
  false returned non-zero
  [1]
