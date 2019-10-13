rule r_add_mgi_symbol_from_ensembl_gene_id:
    input: 
        tsv="out/r/get_rna_rpk_tmm/subread/featureCounts_-O_-t_exon_-g_gene_id_gtf-hg38-ensembl_bam-hg38-RNA-thymus.tsv"
    output:
        tsv="out/r/add_mgi_symbol_from_ensembl_gene_id/r/get_rna_rpk_tmm/subread/featureCounts_-O_-t_exon_-g_gene_id_gtf-hg38-ensembl_bam-hg38-RNA-thymus.tsv"
    conda:
        "../../../../mw-lib/src/snakemake/envs/r_deseq2_edger.yaml"
    script:
        "../../r/script/add_hgnc_symbol_from_ensembl_gene_id.R"

