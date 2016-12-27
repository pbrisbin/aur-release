# AUR-release

A small script for releasing your own packages to the AUR from within their
source directory.

## Installation

Install `aur-release` from the AUR, of course.

## Usage

Within a source directory, run `aur-release VERSION`.

This will:

1. `git` tag the sources at that version (if needed)
1. Clone the package repository from the AUR to a temp directory
1. Update the `pkgver` and `pkgrel`
1. Update the checksums
1. Make a `.SRCINFO`
1. Commit the updated files & push

`VERSION` can be `v1.2.3` or `1.2.3`. Any leading `v` will be stripped when used
as `pkgver` but (re-)added for the `git` tag.

The package name is assumed to be the same as the basename of the source
directory where you run `aur-release`. Or it can be passed as an optional second
argument.
