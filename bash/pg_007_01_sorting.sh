#!/bin/sh

DIR1=006_fastq
DIR2=007_bam
# 入力ファイルをHISAT2の出力名に合わせる
INCOMING=${DIR1}/pg_006_01_tiny1.hisat2_Aligned.out.sam
OUTGOING=${DIR2}/pg_007_01_tiny1.aligned.sorted.bam

mkdir -p ${DIR2}

#-----------------------------------------------------------------------------80
# Sort the alignment result.
#-----------------------------------------------------------------------------80
picard SortSam I=${INCOMING} O=${OUTGOING} SO=queryname

samtools view -h ${OUTGOING} > ${OUTGOING}.sam
