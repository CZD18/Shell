#! bin/bash
#-- This script was done to count files in a folder using the names of a file (from tcga data)
######### -- Location of your folder
DG=$PWD
####### -- Next grep to get only the first colummn from the tcganames.csv to generate 'cancer_id'
#grep -o '^[^,]\+'  /courses/example-data/csv/tcganames.csv > '1c.csv'
###### -- Go to the tcga files
cd /courses/example-data/vcf/tcga/
#### Reading each line from 1c.csv to count in the tcga folder

while read -r row; do
ls -dq *$row* | wc -l
done < $DG/1c.csv > $DG/'count.csv'
### Going back to your place
cd $DG
### Generating the final file on .csv format merging 
paste -d, 1c.csv count.csv > FINAL.csv

