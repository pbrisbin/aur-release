# AUR-release

Release an [AUR][] package, by updating or creating its AUR repository.

[aur]: https://wiki.archlinux.org/index.php/Arch_User_Repository#Sharing_and_maintaining_packages

## Installation

Install `aur-release-git` from the AUR, of course.

## Usage

```console
% aur-release -h
Usage: aur-release [-c COMMAND] [-deyn] [NAME [VERSION]]
Release an AUR package by updating or creating its AUR repository.

Options:
  -c COMMAND    Command to run when version is not given (or -e is passed).
                Default is $SHELL.
  -d            Treat the current directory as the AUR repository, and do not
                operate in a temporary clone.
  -e            Edit (via -c), even if version was given.
  -y            Yes, push to the remote -- don't require confirmation.
  -n            No test installation.

Arguments:
  NAME          Name of the AUR repository. Defaults to the basename of the
                current working directory.
  VERSION       Version to set in PKGBUILD (along with pkgrel=1). Default is
                empty (you are expected to adjust version manually).

```

---

[CHANGELOG](./CHANGELOG.md) | [LICENSE](./LICENSE)
