# mw-cieslak2019
MetaWorkflow module to reproduce the bioinformatics analyses that are going to be published in "Epigenomic dynamics of human T-cell precursors reveal TCRA enhancer silencing by HOXA". Processed data used in the article are freely accessible [here](http://genome-euro.ucsc.edu/cgi-bin/hgTracks?hubUrl=https://raw.githubusercontent.com/guillaumecharbonnier/mw-cieslak2019/master/src/hub/hub.txt&genome=hg38).

## Requirements:
- conda
- snakemake
- raw input data files from in house or Blueprint project. (Note these files will be available only upon publication)

## Instructions:
```
git clone git@github.com:guillaumecharbonnier/mw-lib.git
git clone git@github.com:guillaumecharbonnier/mw-cieslak2019.git
cd mw-cieslak2019
```
Then you can ask Snakemake some of these targets:
```
snakemake target_make_ucsc_hub_hg38 
snakemake target_cieslak2019_make_histone_marks_chip_upload_to_sra 
snakemake target_cieslak2019_make_tf_chip_upload_to_sra
snakemake target_cieslak2019_make_atac_upload_to_sra
```
Other analyses are currently in a private repository and will be moved here upon publication.

