#!/bin/sh

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

