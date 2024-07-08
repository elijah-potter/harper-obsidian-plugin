clean:
  rm -rf harper

# Pull and checkout the source code for the plugin version specified in `manifest.json`
pull-source:
  #! /bin/bash
  set -eo pipefail

  just clean

  version=v`cat manifest.json | jq -r '.version'`

  echo Pulling version $version

  git clone https://github.com/elijah-potter/harper
  cd harper
  git checkout tags/$version

# Build the plugin, assuming the source has already been downloaded
build:
  cd harper && just build-obsidian
  cp harper/packages/obsidian-plugin/main.js .
