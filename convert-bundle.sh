#!/bin/bash
set -euo pipefail

# 2. fetch the tarball
curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

# 3. decompress / open the archive
tar -xzvf lab3-bundle.tar.gz

# 4. remove empty rows
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

# 5. convert TSV to CSV
tr '\t' ',' < cleaned.tsv > cleaned.csv

# 6. count data rows (excluding header) and echo it
ROWS=$(tail -n +2 cleaned.csv | wc -l)
echo "Number of data rows: $ROWS"

# 7. package the cleaned CSV
tar -czvf converted-archive.tar.gz cleaned.csv