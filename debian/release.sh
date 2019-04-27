#!/bin/bash

set -e

source=$(dpkg-parsechangelog -S Source)
version=$(dpkg-parsechangelog -S Version | sed s/^1://)

debuild -S -d
debuild -d -- clean

dput ppa:ev3dev/tools ../${source}_${version}_source.changes

gbp buildpackage --git-tag-only
