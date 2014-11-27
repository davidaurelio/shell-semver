#!/usr/bin/env sh

semver_regex() {
  local VERSION="([0-9])+[.]([0-9])+[.]([0-9])+"
  local INFO="([0-9A-Za-z-]+(?:[.][0-9A-Za-z-]+)*)"
  local PRERELEASE="(?:-${INFO})"
  local METAINFO="(?:[+]${INFO})"
  echo "^${VERSION}${PRERELEASE}?${METAINFO}?$"
}

SEMVER_REGEX=`semver_regex`
unset -f semver_regex

semver_check() {
  echo $1 | grep -Eq "$SEMVER_REGEX"
}

semver_parse() {
  semver_check "$1" && echo $1 | sed "s/$SEMVER_REGEX//"
}
