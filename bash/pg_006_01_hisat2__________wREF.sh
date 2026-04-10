#!/bin/sh

DIR1=006_fastq
# HISAT2用のインデックスを指定してください（例: genome_prefix）
REF=001_data/001_reference/HISAT2_index_chr8/genome_prefix
INCOMING=${DIR1}/pg_005_07_tiny1.cb.umi.qc.woAdapter.trimPolyA.fastq
NCORES=1

#-----------------------------------------------------------------------------80
# HISAT2 alignment
#-----------------------------------------------------------------------------80
# --summary-file: 統計情報の出力先
# -U: シングルエンド入力 (pg_005_07で結合されたFASTQのため)
#-----------------------------------------------------------------------------80
hisat2 -p ${NCORES} \
  -x ${REF} \
  -U ${INCOMING} \
  --summary-file ${DIR1}/pg_006_01_tiny1.hisat2_summary.txt \
  -S ${DIR1}/pg_006_01_tiny1.hisat2_Aligned.out.sam
