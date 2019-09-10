rule target_make_ucsc_hub:
    input:
        expand("out/ucsc/bedToBigBed_chrominfo-hg19/sort/_-k1,1_-k2,2n/tail/_-n+2/ChromHMM/MakeBrowserFiles/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/{stage}_11_segments_dense.bb", stage=THYMIC_STAGES),
        expand("out/ucsc/wigToBigWig_-clip_chrominfo-hg19/danpos/wiq_chrominfo-hg19/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/{sample}_qnorVS_TH91_SP8_H3K4me3.bw", sample=["TH101_LC_H3K4me3", "TH118_LC_H3K4me3", "TH134_CD34_H3K4me3", "TH89_EC_H3K4me3", "TH91_EC_H3K4me3", "TH91_LC_H3K4me3", "TH91_SP4_H3K4me3", "TH91_SP8_H3K4me3"])
    shell:
        """
        for FILE in {input};
        do
            cp $FILE ../mw-cieslak2019/src/hub/hg19/`basename $FILE`
        done
        """



#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/LC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH101_LC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH118_LC_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH118_LC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH125_SP8_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH134_CD34_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH134_CD34_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH89_EC_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH89_EC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_EC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_LC_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_LC_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_SP4_H3K27ac_qnorVS_TH125_SP8_H3K27ac.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_SP4_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
#out/danpos/wiq_chrominfo-hg38/danpos/dtriple/ln/alias/sst/all_samples/hg19/bam/TH91_SP8_H3K4me3_qnorVS_TH91_SP8_H3K4me3.wig
