#!/bin/bash

set -e

yarn

rm -rf generated build
yarn codegen
yarn build
graph create --node http://localhost:8020/ blocklytics/ethereum-blocks
graph deploy --version-label v0.0.1 --node http://localhost:8020/ --ipfs http://localhost:5001 blocklytics/ethereum-blocks
