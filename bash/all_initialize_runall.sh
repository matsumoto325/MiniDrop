#!/bin/sh

echo "rm -rf 004_fastq"
rm -rf 004_fastq
echo "rm -rf 005_bam"
rm -rf 005_bam
echo "rm -rf 006_fastq"
rm -rf 006_fastq
echo "rm -rf 007_bam"
rm -rf 007_bam
echo "rm -rf 008_count"
rm -rf 008_count

echo ""
echo "pg_004_01_create_fastq.sh"
bash pg_004_01_create_fastq.sh
echo ""
echo "pg_005_01_fastq2bam.sh"
bash pg_005_01_fastq2bam.sh
echo ""
echo "pg_005_02_cellbarcode_tag.sh"
bash pg_005_02_cellbarcode_tag.sh
echo ""
echo "pg_005_03_umi_tag.sh"
bash pg_005_03_umi_tag.sh
echo ""
echo "pg_005_04_read_qc.sh"
bash pg_005_04_read_qc.sh
echo ""
echo "pg_005_05_remove_adapter.sh"
bash pg_005_05_remove_adapter.sh
echo ""
echo "pg_005_06_trim_polya.sh"
bash pg_005_06_trim_polya.sh
echo ""
echo "pg_005_07_bam2fastq.sh"
bash pg_005_07_bam2fastq.sh
echo ""
echo "pg_006_01_hisat2__________wREF.sh"
bash pg_006_01_hisat2__________wREF.sh
echo ""
echo "pg_007_01_sorting.sh"
bash pg_007_01_sorting.sh
echo ""
echo "pg_007_02_cb_umi__________wREF.sh"
bash pg_007_02_cb_umi__________wREF.sh
echo ""
echo "pg_007_03_genes__________wREF.sh"
bash pg_007_03_genes__________wREF.sh
echo ""
echo "pg_007_04_fix_beads.sh"
bash pg_007_04_fix_beads.sh
echo ""
echo "pg_007_05_fix2nd_beads.sh"
bash pg_007_05_fix2nd_beads.sh
echo ""
echo "pg_008_01_counts.sh"
bash pg_008_01_counts.sh

