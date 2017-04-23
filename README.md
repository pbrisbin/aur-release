# AUR-release

Tag and release an [AUR][] package.

[aur]: https://wiki.archlinux.org/index.php/Arch_User_Repository#Sharing_and_maintaining_packages

## Installation

Install `aur-release-git` from the AUR, of course.

## Usage

```
Usage: release VERSION [NAME] [FILE, ...]
Tag and release an AUR package.

  NAME          Name of the package, defaults to the basename of the current
                working directory.

  VERSION       Version to release as; can be v1.2.3 or 1.2.3, the released
                package will always drop any leading "v" and the created git
                tags will always add it.

  FILE, ...     Files to copy into the AUR repository before releasing. This is
                most useful for an initial release. In such a case, don't forget
                to include the PKGBUILD itself. Files must be specified as
                relative to the project.
```

---

[CHANGELOG](./CHANGELOG.md) | [LICENSE](./LICENSE)
