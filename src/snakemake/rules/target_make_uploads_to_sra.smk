rule target_cieslak2019:
    input:
        "out/target/cieslak2019_make_atac_upload_to_sra/md5sum.txt",
        "out/target/cieslak2019_make_histone_marks_chip_upload_to_sra/md5sum.txt",
        "out/target/cieslak2019_make_tf_chip_upload_to_sra/md5sum.txt"

CIESLAK2019_ATAC_SAMPLES=[
    #"TH148_149_CD34pos_1aneg_7neg",
    "TH148_CD34pos_1aneg_7pos",
    "TH149_CD34pos_1aneg_7pos",
    "TH148_CD34pos_1apos",
    "TH149_CD34pos_1apos",
    "TH148_EC",
    "TH149_EC",
    "TH148_LC",
    "TH149_LC"]

rule target_cieslak2019_make_atac_upload_to_sra:
    input:
        expand("out/ln/alias/sst/all_samples/fastq/{sample}.fastq.gz", sample=CIESLAK2019_ATAC_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/bw/{sample}.bw", sample=CIESLAK2019_ATAC_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/peaks/narrow/{sample}.bed", sample=CIESLAK2019_ATAC_SAMPLES)
    output:
        "out/target/cieslak2019_make_atac_upload_to_sra/md5sum.txt"
    shell:
        """
        OUTDIR=`dirname {output}`
        for FILE in {input};
        do
            OUTFILE=$OUTDIR/`basename $FILE`
            cp -L $FILE $OUTFILE
            md5sum $OUTFILE >> {output}
        done
        # Annoying because of the file order does not match order of samples in metadata table for GEO.
        #md5sum $OUTDIR/* > {output} 
        """

CIESLAK2019_TF_CHIP_SAMPLES=[
    "TH137_CD34_RUNX1"]
#    "TH129_EC_RUNX1",
#    "TH129_LC_RUNX1",
#    "TH129_EC_ETS1",
#    "TH139_EC_ETS1",
#    "TH129_LC_ETS1",
#    "TH139_LC_ETS1"]

rule target_cieslak2019_make_tf_chip_upload_to_sra:
    input:
        expand("out/ln/alias/sst/all_samples/fastq/{sample}.fastq.gz", sample=CIESLAK2019_TF_CHIP_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/bw/{sample}.bw", sample=CIESLAK2019_TF_CHIP_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/peaks/narrow/{sample}.bed", sample=CIESLAK2019_TF_CHIP_SAMPLES)
    output:
        "out/target/cieslak2019_make_tf_chip_upload_to_sra/md5sum.txt"
    shell:
        """
        OUTDIR=`dirname {output}`
        for FILE in {input};
        do
            OUTFILE=$OUTDIR/`basename $FILE`
            cp -L $FILE $OUTFILE
            md5sum $OUTFILE >> {output}
        done
        #md5sum $OUTDIR/* > {output}
        """

CIESLAK2019_HISTONE_MARKS_CHIP_SAMPLES=[
    "TH125_EC_H3K27ac",
    "TH125_EC_H3K27me3",
    "TH125_LC_H3K4me1",
    "TH125_LC_H3K27ac",
    "TH117_LC_H3K27me3",
    "TH125_LC_H3K36me3",
    "TH125_SP4_H3K27ac"]

rule target_cieslak2019_make_histone_marks_chip_upload_to_sra:
    input:
        expand("out/ln/alias/sst/all_samples/fastq/{sample}.fastq.gz", sample=CIESLAK2019_HISTONE_MARKS_CHIP_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/bw/{sample}.bw", sample=CIESLAK2019_HISTONE_MARKS_CHIP_SAMPLES),
        expand("out/ln/alias/sst/all_samples/GRCh38/peaks/broad/{sample}.bed", sample=CIESLAK2019_HISTONE_MARKS_CHIP_SAMPLES)
    output:
        "out/target/cieslak2019_make_histone_marks_chip_upload_to_sra/md5sum.txt"
    shell:
        """
        OUTDIR=`dirname {output}`
        for FILE in {input};
        do
            OUTFILE=$OUTDIR/`basename $FILE`
            cp -L $FILE $OUTFILE
            md5sum $OUTFILE >> {output}
        done
        #md5sum $OUTDIR/* > {output}
        """

