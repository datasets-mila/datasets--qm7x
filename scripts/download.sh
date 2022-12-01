#!/bin/bash
source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'

wget "https://zenodo.org/record/4288677/files/README.txt?download=1" -O "README.txt"

files_url=(
	"https://zenodo.org/record/4288677/files/1000.xz?download=1 1000.xz"
	"https://zenodo.org/record/4288677/files/2000.xz?download=1 2000.xz"
	"https://zenodo.org/record/4288677/files/3000.xz?download=1 3000.xz"
	"https://zenodo.org/record/4288677/files/4000.xz?download=1 4000.xz"
	"https://zenodo.org/record/4288677/files/5000.xz?download=1 5000.xz"
	"https://zenodo.org/record/4288677/files/6000.xz?download=1 6000.xz"
	"https://zenodo.org/record/4288677/files/7000.xz?download=1 7000.xz"
	"https://zenodo.org/record/4288677/files/8000.xz?download=1 8000.xz"
	"https://zenodo.org/record/4288677/files/createDB.py?download=1 createDB.py"
	"https://zenodo.org/record/4288677/files/DupMols.dat?download=1 DupMols.dat")

# These urls require login cookies to download the file
git-annex addurl --fast -c annex.largefiles=anything --raw --batch --with-files <<EOF
$(for file_url in "${files_url[@]}" ; do echo "${file_url}" ; done)
EOF
git-annex get --fast -J8
git-annex migrate --fast -c annex.largefiles=anything *

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(list -- --fast) > md5sums
