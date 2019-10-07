# mw-cieslak2019
MetaWorkflow module for the bioinformatics analyses published in "Epigenomic dynamics of human T-cell precursors reveal TCRA enhancer silencing by HOXA". Processed data used in the article are freely accessible [http://genome-euro.ucsc.edu/cgi-bin/hgTracks?hubUrl=https://raw.githubusercontent.com/guillaumecharbonnier/mw-cieslak2019/master/src/hub/hub.txt&genome=hg19](here)


## Requirements:
- conda
- snakemake
- raw input data files from in house or Blueprint project. (Work in progress to make these files available)

## Instructions:
```
git clone git@github.com:guillaumecharbonnier/mw-lib.git
git clone git@github.com:guillaumecharbonnier/mw-cieslak2019.git
cd mw-cieslak2019
```
Then you can ask Snakemke some of these targets:
```
snakemake WORKINPROGRESS
```
