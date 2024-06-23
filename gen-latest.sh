#!/bin/sh
docker run -v ./generated-latest:/generated-latest openapitools/openapi-generator-cli:latest generate -g typescript-axios -i https://github.com/turtton/openapi-generator-bug-reproduction/raw/main/api.yaml -o generated-latest
