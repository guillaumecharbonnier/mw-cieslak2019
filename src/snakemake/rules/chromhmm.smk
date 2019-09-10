rule ChromHMM_MakeSegments_our_thymic_merged_samples_into_chromdet_original_paper:
    """
    Created:
        2018-05-10 23:52:21
    Note:
        out/ChromHMM/BinarizeBed_b-200_chrominfo-hg19-main-chr_merged-Blueprint-thymic-populations-with-input-as-control-hg19/done
        out/wget/ftp/ftp.ebi.ac.uk/pub/databases/blueprint/paper_data_sets/chromatin_states_carrillo_build37/
    """
    input:
        #chromhmm="opt/miniconda/envs/chromhmm/bin/ChromHMM.sh",
        model="out/wget/ftp/ftp.ebi.ac.uk/pub/databases/blueprint/paper_data_sets/chromatin_states_carrillo_build37/model_11_All_cell_types.txt",
        binarisation_done="out/ChromHMM/BinarizeBed_chrominfo-hg19-main-chr_merged-Blueprint-thymic-populations-with-input-as-control-hg19/done"
    output:
        segments=expand("out/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/{sample}_11_segments.bed", sample=THYMIC_STAGES)
    log:
        "out/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/log"
    benchmark:
        "out/ChromHMM/MakeSegments_our_merged_thymic_samples_into_chromdet_original_paper/benchmark.tsv"
    params:
        memory="65536m" # previously 32768 but not enough for test9
    conda:
        "../envs/chromhmm.yaml"
    shell:
        """
        ChromHMM.sh\
            -Xmx{params.memory}\
            MakeSegmentation\
            {input.model}\
            `dirname {input.binarisation_done}`\
            `dirname {log}` &> {log}
        """

rule ChromHMM_MakeSegments_our_thymic_samples_into_chromdet_original_paper:
    """
    Created:
        2018-04-17 15:11:30
    Note:
        out/ChromHMM/BinarizeBed_b-200_chrominfo-hg19-main-chr_Blueprint-thymic-populations-with-input-as-control-hg19/done
        out/wget/ftp/ftp.ebi.ac.uk/pub/databases/blueprint/paper_data_sets/chromatin_states_carrillo_build37/
    """
    input:
        model="out/wget/ftp/ftp.ebi.ac.uk/pub/databases/blueprint/paper_data_sets/chromatin_states_carrillo_build37/model_11_All_cell_types.txt",
        binarisation_done="out/ChromHMM/BinarizeBed_chrominfo-hg19-main-chr_Blueprint-thymic-populations-with-input-as-control-hg19/done"
    output:
        segments=expand("out/ChromHMM/MakeSegments_our_thymic_samples_into_chromdet_original_paper/{sample}_11_segments.bed",sample=OUR_COMPLETE_THYMIC_SAMPLES_INTO_CHROMDET_ORIGINAL_PAPER)
    log:
        "out/ChromHMM/MakeSegments_our_thymic_samples_into_chromdet_original_paper/log"
    benchmark:
        "out/ChromHMM/MakeSegments_our_thymic_samples_into_chromdet_original_paper/benchmark.tsv"
    params:
        memory="65536m" # previously 32768 but not enough for test9
    conda:
        "../envs/chromhmm.yaml"
    shell:
        """
        ChromHMM.sh\
            -Xmx{params.memory}\
            MakeSegmentation\
            {input.model}\
            `dirname {input.binarisation_done}`\
            `dirname {log}` &> {log}
        """


