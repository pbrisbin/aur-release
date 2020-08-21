  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH
  > _aur_release() { aur-release -y -n "$@"; }

It releases a separate AUR package repo with name and version

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

It releases a separate AUR package repo with only name

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

It releases a separate AUR package without name or version

  $ _aur_release -c true
  Releasing aur-release.t-unknown
  Releasing in separate AUR repository
  git clone ssh://aur@aur.archlinux.org/aur-release.t /tmp/* (glob)
  Launching true in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push

It releases the current directory with name and version

  $ _aur_release -d -e -c write-package -n foo-git v1.2.3
  Releasing foo-git-v1.2.3
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/foo-git
  git fetch aur
  git branch --set-upstream-to=aur/master
  Launching write-package in AUR package repo
  Setting PKGBUILD version to v1.2.3
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit -m Release v1.2.3
  git push

It releases the current directory with only name

  $ _aur_release -d -c write-package -n foo-git
  Releasing foo-git-unknown
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/foo-git
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

It releases the current directory without name or version

  $ _aur_release -d -c write-package
  Releasing aur-release.t-unknown
  Releasing in this directory
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

It exits if the command fails in a separate repository

  $ _aur_release -c false package
  Releasing package-unknown
  Releasing in separate AUR repository
  git clone ssh://aur@aur.archlinux.org/package /tmp/* (glob)
  Launching false in AUR package repo
  false returned non-zero
  [1]

It exits if the command fails in the current directory

  $ _aur_release -d -c false package
  Releasing package-unknown
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/package
  git fetch aur
  git branch --set-upstream-to=aur/master
  Launching false in AUR package repo
  false returned non-zero
  [1]
