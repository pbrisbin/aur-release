# AUR-release

Release packages to the [AUR][] from within their source directory.

[aur]: https://wiki.archlinux.org/index.php/Arch_User_Repository#Sharing_and_maintaining_packages

## Installation

Install `aur-release-git` from the AUR, of course.

## Usage

```
aur-release VERSION [NAME]
```

This will:

1. `git` tag the sources at `VERSION` (if needed)
1. Clone the package repository from the AUR to a temp directory
1. Update the `pkgver` to `VERSION`
1. Reset `pkgrel` to `1`
1. Update the checksums
1. Make a `.SRCINFO`
1. Commit the updated files & push

`VERSION` can be `v1.2.3` or `1.2.3`. Any leading `v` will be stripped when used
as `pkgver` but (re-)added for the `git` tag.

The package name is assumed to be the same as the basename of the source
directory where you run `aur-release`. Or it can be passed as an optional second
argument.

## First Submissions

If no `PKGBUILD` is found in the cloned AUR repository, the script will assume
this is the first release, copy in the `PKGBUILD` from the source directory and
proceed. If files other than the `PKGBUILD` are required in the package
repository, you should address this manually.

---

[CHANGELOG](./CHANGELOG.md) | [LICENSE](./LICENSE)
