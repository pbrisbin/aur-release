  $ export PATH=$TESTDIR/../bin:$TESTDIR/bin:$PATH
  > _aur_release() { aur-release -y -n -d "$@"; }

With name and version

  $ _aur_release -e -c write-package -n foo-git v1.2.3
  Releasing foo-git-v1.2.3
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/foo-git
  git fetch aur
  git checkout -b aur
  git reset --hard aur/master
  git branch --set-upstream-to=aur/master
  Launching write-package in AUR package repo
  Setting PKGBUILD version to v1.2.3
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit -m Release v1.2.3
  git push aur aur:master
  git checkout master

With only name

  $ _aur_release -c write-package -n foo-git
  Releasing foo-git-unknown
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/foo-git
  git fetch aur
  git checkout -b aur
  git reset --hard aur/master
  git branch --set-upstream-to=aur/master
  Launching write-package in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push aur aur:master
  git checkout master

Without name or version

  $ _aur_release -c write-package
  Releasing current-directory.t-unknown
  Releasing in this directory
  git remote add aur ssh://aur@aur.archlinux.org/current-directory.t
  git fetch aur
  git checkout -b aur
  git reset --hard aur/master
  git branch --set-upstream-to=aur/master
  Launching write-package in AUR package repo
  ==> Retrieving sources...
    -> Found source.txt
  ==> Generating checksums for source files...
  git add .SRCINFO PKGBUILD
  git diff --cached
  git commit
  git push aur aur:master
  git checkout master
