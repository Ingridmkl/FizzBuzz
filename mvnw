#!/usr/bin/env bash
set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
MAVEN_DIR="$ROOT/.maven/apache-maven-3.9.6"
if [ ! -x "$MAVEN_DIR/bin/mvn" ]; then
  mkdir -p "$ROOT/.maven"
  ZIP="$ROOT/.maven/maven.zip"
  URL="https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
  if command -v curl >/dev/null 2>&1; then
    curl -sSLo "$ZIP" "$URL"
  else
    wget -qO "$ZIP" "$URL"
  fi
  unzip -q "$ZIP" -d "$ROOT/.maven"
  rm "$ZIP"
fi
exec "$MAVEN_DIR/bin/mvn" "$@"
