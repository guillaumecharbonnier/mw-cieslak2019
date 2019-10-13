rule target_make_ucsc_hub_hg19:
    input:
        expand("out/ucsc/bedToBigBed_chrominfo-hg19/sort/_-k1,1_-k2,2n/tail/_-n+2/ChromHMM/MakeBrowserFiles/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/{stage}_11_segments_dense.bb", stage=THYMIC_STAGES),
        expand("out/ucsc/wigToBigWig_-clip_chrominfo-hg19/danpos/wiq_chrominfo-hg19/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/{sample}_qnorVS_TH91_SP8_H3K4me3.bw", sample=["TH101_LC_H3K4me3", "TH118_LC_H3K4me3", "TH134_CD34_H3K4me3", "TH89_EC_H3K4me3", "TH91_EC_H3K4me3", "TH91_LC_H3K4me3", "TH91_SP4_H3K4me3", "TH91_SP8_H3K4me3"])
    shell:
        """
        for FILE in {input};
        do
            #NOTE: FIRST ATTEMPT PUTTING DATA IN GIT REPO BUT UNUSED NOW AS CYVERSE IS BETTER SUITED FOR LARGE GENOMIC DATA
            cp $FILE ../mw-cieslak2019/src/hub/hg19/`basename $FILE`
        done
        """

rule target_make_ucsc_hub_hg38:
    """
    Created:
        2019-10-13 16:36:36
    Aim:
        Produce files that should be then uploaded to cyverse to be made available in UCSC browser.
    Note:
        iput -K -P -b -r -T --retries 3 -X checkpoint-file make_ucsc_hub_hg38/

    """
    input:
        expand("out/ln/alias/experiments/quantile_normalized_VS_SP8_bw_hg38/{mark}_{stage}.bw", stage=THYMIC_STAGES, mark=SIX_MAIN_HISTONE_MARKS),
        expand("out/ucsc/bedToBigBed_chrominfo-hg38/awk/fix_bed9_thick_cols/sort/_-k1,1_-k2,2n/tail/_-n+2/crossmap/chain-hg19-to-hg38/ChromHMM/MakeBrowserFiles/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/{stage}_11_segments_dense.bb", stage=THYMIC_STAGES)
    output:
        touch("out/target/make_ucsc_hub_hg38/done")
    shell:
        """
        for FILE in {input};
        do
            cp -L $FILE out/target/make_ucsc_hub_hg38/`basename $FILE`
        done
        """

