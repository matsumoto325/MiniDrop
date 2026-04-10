#!/bin/sh

DIR1=005_bam
DIR2=006_fastq
INCOMING=${DIR1}/pg_005_06_tiny1.cb.umi.qc.woAdapter.trimPolyA.bam
OUTGOING=${DIR2}/pg_005_07_tiny1.cb.umi.qc.woAdapter.trimPolyA.fastq
#-----------------------------------------------------------------------------80
# Make directory.
#-----------------------------------------------------------------------------80
mkdir -p ${DIR2}

#-----------------------------------------------------------------------------80
# Change the data format from BAM to FASTQ.
#-----------------------------------------------------------------------------80
picard SamToFastq INPUT=${INCOMING} FASTQ=${OUTGOING}

#-----------------------------------------------------------------------------80
# HISAT2 Index Generation with Git LFS check
#-----------------------------------------------------------------------------80
FASTA=001_data/001_reference/chr8.fa
INDEX_DIR=001_data/001_reference/HISAT2_index_chr8
PREFIX=${INDEX_DIR}/genome_prefix

# Check if the FASTA file is a Git LFS pointer
if grep -q "version https://git-lfs.github.com/spec/v1" "${FASTA}"; then
    echo "-----------------------------------------------------------------------"
    echo "NOTICE: Reference file appears to be a Git LFS pointer."
    echo "Attempting to download the actual file using 'git lfs pull'..."
    echo "-----------------------------------------------------------------------"
    
    if command -v git-lfs > /dev/null; then
        git lfs pull
    else
        echo "ERROR: 'git-lfs' is not installed."
        echo "Please install Git LFS to proceed (e.g., 'sudo apt install git-lfs' and 'git lfs install')."
        exit 1
    fi
fi

# Re-check after pull attempt
if grep -q "version https://git-lfs.github.com/spec/v1" "${FASTA}"; then
    echo "ERROR: Reference file is still a Git LFS pointer."
    echo "Please ensure you have run 'git lfs install' and 'git lfs pull' correctly."
    exit 1
fi

echo "Starting HISAT2 index generation..."
mkdir -p ${INDEX_DIR}
hisat2-build ${FASTA} ${PREFIX}

echo "HISAT2 index process finished."
