#!/bin/bash

# For AMD64 / x86_64 on macOS
if [ "$(uname -m)" = "x86_64" ]; then
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-darwin-amd64
elif [ "$(uname -m)" = "arm64" ]; then
  # For Apple Silicon M1/M2
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-darwin-arm64
else
  echo "Unsupported architecture: $(uname -m)"
  exit 1
fi

chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind
rm -f ./kind

