#!/bin/bash

echo Compiling
echo ""

elm make ./src/Counter.elm --output counter.js
mv -v ./counter.js ../../../app/assets/javascripts/
