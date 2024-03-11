#!/bin/bash

# These commands are where we self-modify the repository and
# they aren't allowed in the Embroidermodder or libembroidery repositories.
mkdir downloads
mv build/embroider downloads
git add downloads/embroider
git commit -m "Updating embroider daily"
git push origin main
