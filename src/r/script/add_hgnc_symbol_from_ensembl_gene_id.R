library(biomaRt)
library(data.table)

# Defining parameters when run outside of snakemake script:
if (!exists("snakemake")){
    setClass("Snakemake", representation(input = "list", output = "list", wildcards = "list"))
    snakemake <- new("Snakemake",
                     input = list(tsv = "out/r/get_rna_rpk_tmm/subread/featureCounts_-O_-t_exon_-g_gene_id_gtf-hg38-ensembl_bam-hg38-RNA-thymus.tsv"),
                     output  = list(tsv = "out/r/add_hgnc_symbol_from_ensembl_gene_id/r/get_rna_rpk_tmm/subread/featureCounts_-O_-t_exon_-g_gene_id_gtf-hg38-ensembl_bam-hg38-RNA-thymus.tsv"),
                     wildcards = list())
}

dt <- data.table::fread(snakemake@input$tsv)
mart <- useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
#mgi_vec <- scan(file=infile, what="character")
results <- getBM(attributes = c("ensembl_gene_id", "hgnc_symbol"), filters = "ensembl_gene_id", values = dt[,1], mart = mart)

setnames(dt, "geneId", "ensembl_gene_id")
setDT(results)
output <- merge(results, dt, by='ensembl_gene_id')

fwrite(x=output, file=snakemake@output$tsv)
