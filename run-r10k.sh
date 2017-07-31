#!/bin/bash

cd "$(dirname "$0")"/puppet
r10k puppetfile install
