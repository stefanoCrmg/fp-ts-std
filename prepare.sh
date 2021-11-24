#!/bin/sh

rm -rf ./dist/
mkdir -p ./dist/esm/

cp ./README.md ./dist/
cat ./package.json | grep -v '\"private\":' > ./dist/package.json
cat > ./dist/esm/package.json << EOF
{
  "type": "module"
}
EOF
