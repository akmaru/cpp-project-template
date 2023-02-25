#!/bin/bash
set -euo pipefail

apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    gdb \
    git \
    libcurl4-openssl-dev \
    ninja-build \
    openssh-client \
    pkg-config \
    unzip \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
