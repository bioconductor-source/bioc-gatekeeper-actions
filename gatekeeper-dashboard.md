# Bioconductor Gatekeeper Dashboard

**Last Updated:** 2025-08-22 18:38:41 UTC

## 📊 Quick Statistics

- **Total Packages:** 110
- **✅ Passed:** 88
- **❌ Failed:** 21
- **Pending:** 0
- **Never Checked:** 0

## ❌ Failed Packages

**21 packages are currently failing checks:**

| Package | Version | Last Check | Issues | Warnings |
|---------|---------|------------|--------|----------|
| **affyio** | 1.78.0 | 2025-08-22 17:46:07 UTC | Issues | None |
| **BiocVersion** | 3.21.1 | 2025-08-22 17:46:12 UTC | Issues | None |
| **Biostrings** | 2.76.0 | 2025-08-22 17:45:56 UTC | Issues | None |
| **BSgenome** | 1.76.0 | 2025-08-22 17:45:47 UTC | Issues | None |
| **ComplexHeatmap** | 2.24.1 | 2025-08-22 17:44:07 UTC | Issues | None |
| **ensembldb** | 2.32.0 | 2025-08-22 17:45:11 UTC | Issues | None |
| **flowCore** | 2.20.0 | 2025-08-22 17:45:46 UTC | Issues | None |
| **GenomeInfoDb** | 1.44.2 | 2025-08-22 17:43:51 UTC | Issues | None |
| **GenomicAlignments** | 1.44.0 | 2025-08-22 17:45:17 UTC | Issues | None |
| **GenomicSuperSignature** | 1.16.1 | 2025-08-22 17:44:25 UTC | Issues | None |
| **GEOmetadb** | Unknown | Never | None | None |
| **GEOquery** | 2.76.0 | 2025-08-22 17:45:52 UTC | Issues | None |
| **HDF5Array** | 1.36.0 | 2025-08-22 17:45:05 UTC | Issues | None |
| **IHW** | 1.36.0 | 2025-08-22 17:45:06 UTC | Issues | None |
| **IRanges** | 2.42.0 | 2025-08-22 17:45:57 UTC | Issues | None |
| **lpsymphony** | 1.36.0 | 2025-08-22 17:45:09 UTC | Issues | None |
| **Rgraphviz** | 2.52.0 | 2025-08-22 17:46:02 UTC | Issues | None |
| **rhdf5filters** | 1.20.0 | 2025-08-22 17:44:42 UTC | Issues | None |
| **Rhtslib** | 3.4.0 | 2025-08-22 17:45:12 UTC | Issues | None |
| **sparseMatrixStats** | 1.20.0 | 2025-08-22 17:44:41 UTC | Issues | None |
| **TreeSummarizedExperiment** | 2.16.1 | 2025-08-22 17:44:22 UTC | Issues | None |

### Detailed Failure Information

#### affyio

- **Version:** 1.78.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:46:07 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/read_generic.c (lines: 1465, 1467, 1471, 1476, 1526, 1528, 1533, 1540)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/read_generic.c (lines: 1465, 1467, 1471, 1476, 1526, 1528, 1533, 1540)

#### BiocVersion

- **Version:** 3.21.1
- **Status:** failed
- **Last Check:** 2025-08-22 17:46:12 UTC
- **Issues:**
  - version: Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions
- **Failed Checks:**
  - **version:** 1 issues
    - Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions

#### Biostrings

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:56 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in inst/unitTests/test_matchDNAPattern.R.FIXME (lines: 1, 33, 158, 159, 199)
  - large_files: inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in inst/unitTests/test_matchDNAPattern.R.FIXME (lines: 1, 33, 158, 159, 199)
  - **large_files:** 1 issues
    - inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)

#### BSgenome

- **Version:** 1.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:47 UTC
- **Issues:**
  - large_files: inst/extdata/ce2chrX.fa.gz (5.23 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/ce2chrX.fa.gz (5.23 MB)

#### ComplexHeatmap

- **Version:** 2.24.1
- **Status:** failed
- **Last Check:** 2025-08-22 17:44:07 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in extra/ComplexHeatmap.html (lines: 2369, 2400, 2419, 2450)
  - merge_markers: Merge marker '=======' found in man/anno_block.Rd (lines: 50, 81)
  - merge_markers: Merge marker '=======' found in R/AnnotationFunction-function.R (lines: 3620, 3651)
- **Failed Checks:**
  - **merge_markers:** 3 issues
    - Merge marker '=======' found in extra/ComplexHeatmap.html (lines: 2369, 2400, 2419, 2450)
    - Merge marker '=======' found in man/anno_block.Rd (lines: 50, 81)
    - Merge marker '=======' found in R/AnnotationFunction-function.R (lines: 3620, 3651)

#### ensembldb

- **Version:** 2.32.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:11 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in R/seqname-utils.R (lines: 229)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in R/seqname-utils.R (lines: 229)

#### flowCore

- **Version:** 2.20.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:46 UTC
- **Issues:**
  - large_files: data/GvHD.rda (5.44 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - data/GvHD.rda (5.44 MB)

#### GenomeInfoDb

- **Version:** 1.44.2
- **Status:** failed
- **Last Check:** 2025-08-22 17:43:51 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in inst/registered/NCBI_assemblies/Escherichia_coli.R (lines: 173, 195)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in inst/registered/NCBI_assemblies/Escherichia_coli.R (lines: 173, 195)

#### GenomicAlignments

- **Version:** 1.44.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:17 UTC
- **Issues:**
  - merge_markers: Merge marker '>>>>>>>' found in inst/doc/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
  - merge_markers: Merge marker '>>>>>>>' found in vignettes/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
- **Failed Checks:**
  - **merge_markers:** 2 issues
    - Merge marker '>>>>>>>' found in inst/doc/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
    - Merge marker '>>>>>>>' found in vignettes/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)

#### GenomicSuperSignature

- **Version:** 1.16.1
- **Status:** failed
- **Last Check:** 2025-08-22 17:44:25 UTC
- **Issues:**
  - merge_markers: Merge marker '<<<<<<<' found in R/validate.R (lines: 30)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '<<<<<<<' found in R/validate.R (lines: 30)

#### GEOmetadb

- **Version:** Unknown
- **Status:** failed
- **Last Check:** Never

#### GEOquery

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:52 UTC
- **Issues:**
  - large_files: inst/extdata/GSE781_family.soft.gz (9.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/GSE781_family.soft.gz (9.67 MB)

#### HDF5Array

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:05 UTC
- **Issues:**
  - large_files: inst/extdata/toy.h5 (7.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/toy.h5 (7.67 MB)

#### IHW

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:06 UTC
- **Issues:**
  - large_files: inst/doc/introduction_to_ihw.html (5.18 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/doc/introduction_to_ihw.html (5.18 MB)

#### IRanges

- **Version:** 2.42.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:57 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/NCList.c (lines: 294, 304, 312, 322)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/NCList.c (lines: 294, 304, 312, 322)

#### lpsymphony

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:09 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/CoinUtils/src/CoinOslFactorization2.cpp (lines: 2645)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/CNRP/include/cnrp_cg.h (lines: 71, 83, 140)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/MPP/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP+CUTS/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/USER/testing (lines: 13)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/VRP/include/vrp_cg.h (lines: 71, 79, 117, 127)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/VRP/testing (lines: 10)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_cg_u.h (lines: 30)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_cg.h (lines: 48, 65, 73)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_cp_u.h (lines: 22)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_cp.h (lines: 65, 95, 103)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_dg_u.h (lines: 25)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_lp_u.h (lines: 32)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_lp.h (lines: 189, 222, 239, 255, 294, 322, 338)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_master_u.h (lines: 21)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_master.h (lines: 85, 100, 119)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/sym_tm.h (lines: 154, 228)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/symphony_api.h (lines: 25)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/include/symphony.h (lines: 191)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/scripts/compile_all (lines: 6, 10)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/scripts/compile_and_clean_all (lines: 6, 11)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/src/Master/master_io.c (lines: 135, 827, 830, 841, 860, 896, 917, 926, 950, 959, 968, 977, 1076, 1180)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/src/Master/master.c (lines: 1508)
  - large_files: src/WinLib/i386/lpsymphony.dll (5.39 MB)
  - large_files: src/WinLib/x64/lpsymphony.dll (6.71 MB)
- **Failed Checks:**
  - **merge_markers:** 24 issues
    - Merge marker '=======' found in src/SYMPHONY/CoinUtils/src/CoinOslFactorization2.cpp (lines: 2645)
    - Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/CNRP/include/cnrp_cg.h (lines: 71, 83, 140)
    - Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/MPP/testing (lines: 6)
    - ... and 21 more issues
  - **large_files:** 2 issues
    - src/WinLib/i386/lpsymphony.dll (5.39 MB)
    - src/WinLib/x64/lpsymphony.dll (6.71 MB)

#### Rgraphviz

- **Version:** 2.52.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:46:02 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/graphviz/lib/neatogen/overlap.c (lines: 247, 405)
  - merge_markers: Merge marker '=======' found in src/graphviz/lib/sfdpgen/post_process.c (lines: 807, 933)
  - merge_markers: Merge marker '=======' found in src/graphviz/lib/sparse/IntStack.c (lines: 77)
- **Failed Checks:**
  - **merge_markers:** 3 issues
    - Merge marker '=======' found in src/graphviz/lib/neatogen/overlap.c (lines: 247, 405)
    - Merge marker '=======' found in src/graphviz/lib/sfdpgen/post_process.c (lines: 807, 933)
    - Merge marker '=======' found in src/graphviz/lib/sparse/IntStack.c (lines: 77)

#### rhdf5filters

- **Version:** 1.20.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:44:42 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/zstd/common/huf.h (lines: 231, 233)
  - merge_markers: Merge marker '=======' found in src/zstd/common/pool.c (lines: 12, 315, 317)
  - merge_markers: Merge marker '=======' found in src/zstd/common/xxhash.h (lines: 1222, 1223, 1224, 2772, 3182, 3673)
  - merge_markers: Merge marker '=======' found in src/zstd/compress/zstd_compress_internal.h (lines: 1396, 1411, 1517)
  - merge_markers: Merge marker '=======' found in src/zstd/compress/zstdmt_compress.c (lines: 1214, 1215, 1216)
  - merge_markers: Merge marker '=======' found in src/zstd/compress/zstdmt_compress.h (lines: 48)
  - merge_markers: Merge marker '=======' found in src/zstd/zstd.h (lines: 2964, 2966)
- **Failed Checks:**
  - **merge_markers:** 7 issues
    - Merge marker '=======' found in src/zstd/common/huf.h (lines: 231, 233)
    - Merge marker '=======' found in src/zstd/common/pool.c (lines: 12, 315, 317)
    - Merge marker '=======' found in src/zstd/common/xxhash.h (lines: 1222, 1223, 1224, 2772, 3182, 3673)
    - ... and 4 more issues

#### Rhtslib

- **Version:** 3.4.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:45:12 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/htslib-1.18/hts.c (lines: 2177, 2193)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/htslib-1.18/hts.c (lines: 2177, 2193)

#### sparseMatrixStats

- **Version:** 1.20.0
- **Status:** failed
- **Last Check:** 2025-08-22 17:44:41 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in R/utils.R (lines: 2)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in R/utils.R (lines: 2)

#### TreeSummarizedExperiment

- **Version:** 2.16.1
- **Status:** failed
- **Last Check:** 2025-08-22 17:44:22 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in R/tree_convertNode.R (lines: 115)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in R/tree_convertNode.R (lines: 115)

## Status Breakdown

### All Packages Status

| Package | Version | Status | Last Check | Last Success | Issues | Warnings |
|---------|---------|--------|------------|--------------|--------|----------|
| affyio | 1.78.0 | ❌ failed failed | 2025-08-22 17:46:07 UTC | Never | Issues | None |
| BiocVersion | 3.21.1 | ❌ failed failed | 2025-08-22 17:46:12 UTC | Never | Issues | None |
| Biostrings | 2.76.0 | ❌ failed failed | 2025-08-22 17:45:56 UTC | Never | Issues | None |
| BSgenome | 1.76.0 | ❌ failed failed | 2025-08-22 17:45:47 UTC | Never | Issues | None |
| ComplexHeatmap | 2.24.1 | ❌ failed failed | 2025-08-22 17:44:07 UTC | Never | Issues | None |
| ensembldb | 2.32.0 | ❌ failed failed | 2025-08-22 17:45:11 UTC | Never | Issues | None |
| flowCore | 2.20.0 | ❌ failed failed | 2025-08-22 17:45:46 UTC | Never | Issues | None |
| GenomeInfoDb | 1.44.2 | ❌ failed failed | 2025-08-22 17:43:51 UTC | Never | Issues | None |
| GenomicAlignments | 1.44.0 | ❌ failed failed | 2025-08-22 17:45:17 UTC | Never | Issues | None |
| GenomicSuperSignature | 1.16.1 | ❌ failed failed | 2025-08-22 17:44:25 UTC | Never | Issues | None |
| GEOmetadb | Unknown | ❌ failed failed | Never | Never | None | None |
| GEOquery | 2.76.0 | ❌ failed failed | 2025-08-22 17:45:52 UTC | Never | Issues | None |
| HDF5Array | 1.36.0 | ❌ failed failed | 2025-08-22 17:45:05 UTC | Never | Issues | None |
| IHW | 1.36.0 | ❌ failed failed | 2025-08-22 17:45:06 UTC | Never | Issues | None |
| IRanges | 2.42.0 | ❌ failed failed | 2025-08-22 17:45:57 UTC | Never | Issues | None |
| lpsymphony | 1.36.0 | ❌ failed failed | 2025-08-22 17:45:09 UTC | Never | Issues | None |
| Rgraphviz | 2.52.0 | ❌ failed failed | 2025-08-22 17:46:02 UTC | Never | Issues | None |
| rhdf5filters | 1.20.0 | ❌ failed failed | 2025-08-22 17:44:42 UTC | Never | Issues | None |
| Rhtslib | 3.4.0 | ❌ failed failed | 2025-08-22 17:45:12 UTC | Never | Issues | None |
| sparseMatrixStats | 1.20.0 | ❌ failed failed | 2025-08-22 17:44:41 UTC | Never | Issues | None |
| TreeSummarizedExperiment | 2.16.1 | ❌ failed failed | 2025-08-22 17:44:22 UTC | Never | Issues | None |
| affy | 1.86.0 | ✅ passed passed | 2025-08-22 17:46:05 UTC | 2025-08-22 17:46:05 UTC | None | None |
| alevinQC | 1.24.0 | ✅ passed passed | 2025-08-22 17:44:48 UTC | 2025-08-22 17:44:48 UTC | None | None |
| annotate | 1.86.1 | ✅ passed passed | 2025-08-22 17:44:11 UTC | 2025-08-22 17:44:11 UTC | None | None |
| AnnotationDbi | 1.70.0 | ✅ passed passed | 2025-08-22 17:45:43 UTC | 2025-08-22 17:45:43 UTC | None | None |
| AnnotationFilter | 1.32.0 | ✅ passed passed | 2025-08-22 17:45:01 UTC | 2025-08-22 17:45:01 UTC | None | None |
| AnnotationHub | 3.16.1 | ✅ passed passed | 2025-08-22 17:44:01 UTC | 2025-08-22 17:44:01 UTC | None | None |
| basilisk | 1.20.0 | ✅ passed passed | 2025-08-22 17:44:44 UTC | 2025-08-22 17:44:44 UTC | None | None |
| basilisk.utils | 1.20.0 | ✅ passed passed | 2025-08-22 17:44:43 UTC | 2025-08-22 17:44:43 UTC | None | None |
| Biobase | 2.68.0 | ✅ passed passed | 2025-08-22 17:46:11 UTC | 2025-08-22 17:46:11 UTC | None | None |
| BiocBaseUtils | 1.10.0 | ✅ passed passed | 2025-08-22 17:44:35 UTC | 2025-08-22 17:44:35 UTC | None | None |
| BiocFileCache | 2.16.1 | ✅ passed passed | 2025-08-22 17:44:02 UTC | 2025-08-22 17:44:02 UTC | None | None |
| BiocGenerics | 0.54.0 | ✅ passed passed | 2025-08-22 17:45:28 UTC | 2025-08-22 17:45:28 UTC | None | None |
| BiocIO | 1.18.0 | ✅ passed passed | 2025-08-22 17:44:38 UTC | 2025-08-22 17:44:38 UTC | None | None |
| BiocParallel | 1.42.1 | ✅ passed passed | 2025-08-22 17:44:15 UTC | 2025-08-22 17:44:15 UTC | None | None |
| BiocPkgTools | 1.26.3 | ✅ passed passed | 2025-08-22 17:43:48 UTC | 2025-08-22 17:43:48 UTC | None | None |
| BiocStyle | 2.36.0 | ✅ passed passed | 2025-08-22 17:45:19 UTC | 2025-08-22 17:45:19 UTC | None | None |
| biocViews | 1.76.0 | ✅ passed passed | 2025-08-22 17:45:53 UTC | 2025-08-22 17:45:53 UTC | None | None |
| biomaRt | 2.64.0 | ✅ passed passed | 2025-08-22 17:45:54 UTC | 2025-08-22 17:45:54 UTC | None | None |
| biovizBase | 1.56.0 | ✅ passed passed | 2025-08-22 17:45:29 UTC | 2025-08-22 17:45:29 UTC | None | None |
| bumphunter | 1.50.0 | ✅ passed passed | 2025-08-22 17:45:23 UTC | 2025-08-22 17:45:23 UTC | None | None |
| ConsensusClusterPlus | 1.72.0 | ✅ passed passed | 2025-08-22 17:45:34 UTC | 2025-08-22 17:45:34 UTC | None | None |
| cytolib | 2.20.0 | ✅ passed passed | 2025-08-22 17:44:58 UTC | 2025-08-22 17:44:58 UTC | None | None |
| DelayedArray | 0.34.1 | ✅ passed passed | 2025-08-22 17:44:29 UTC | 2025-08-22 17:44:29 UTC | None | None |
| DelayedMatrixStats | 1.30.0 | ✅ passed passed | 2025-08-22 17:44:56 UTC | 2025-08-22 17:44:56 UTC | None | None |
| DESeq2 | 1.48.2 | ✅ passed passed | 2025-08-22 17:43:49 UTC | 2025-08-22 17:43:49 UTC | None | None |
| diffcyt | 1.28.0 | ✅ passed passed | 2025-08-22 17:44:49 UTC | 2025-08-22 17:44:49 UTC | None | None |
| dir.expiry | 1.16.0 | ✅ passed passed | 2025-08-22 17:44:37 UTC | 2025-08-22 17:44:37 UTC | None | None |
| DirichletMultinomial | 1.50.0 | ✅ passed passed | 2025-08-22 17:45:25 UTC | 2025-08-22 17:45:25 UTC | None | None |
| EBImage | 4.50.0 | ✅ passed passed | 2025-08-22 17:45:49 UTC | 2025-08-22 17:45:49 UTC | None | None |
| edgeR | 4.6.3 | ✅ passed passed | 2025-08-22 17:44:05 UTC | 2025-08-22 17:44:05 UTC | None | None |
| ExperimentHub | 2.16.1 | ✅ passed passed | 2025-08-22 17:44:03 UTC | 2025-08-22 17:44:03 UTC | None | None |
| ExploreModelMatrix | 1.20.0 | ✅ passed passed | 2025-08-22 17:44:39 UTC | 2025-08-22 17:44:39 UTC | None | None |
| FlowSOM | 2.16.0 | ✅ passed passed | 2025-08-22 17:45:15 UTC | 2025-08-22 17:45:15 UTC | None | None |
| genefilter | 1.90.0 | ✅ passed passed | 2025-08-22 17:46:10 UTC | 2025-08-22 17:46:10 UTC | None | None |
| GenomicDataCommons | 1.32.1 | ✅ passed passed | 2025-08-22 17:44:18 UTC | 2025-08-22 17:44:18 UTC | None | None |
| GenomicFeatures | 1.60.0 | ✅ passed passed | 2025-08-22 17:45:35 UTC | 2025-08-22 17:45:35 UTC | None | None |
| GenomicFiles | 1.44.1 | ✅ passed passed | 2025-08-22 17:44:26 UTC | 2025-08-22 17:44:26 UTC | None | None |
| GenomicRanges | 1.60.0 | ✅ passed passed | 2025-08-22 17:45:33 UTC | 2025-08-22 17:45:33 UTC | None | None |
| ggtree | 3.16.3 | ✅ passed passed | 2025-08-22 17:44:04 UTC | 2025-08-22 17:44:04 UTC | None | None |
| graph | 1.86.0 | ✅ passed passed | 2025-08-22 17:46:03 UTC | 2025-08-22 17:46:03 UTC | None | None |
| Gviz | 1.52.0 | ✅ passed passed | 2025-08-22 17:45:27 UTC | 2025-08-22 17:45:27 UTC | None | None |
| h5mread | 1.0.1 | ✅ passed passed | 2025-08-22 17:44:17 UTC | 2025-08-22 17:44:17 UTC | None | None |
| illuminaio | 0.50.0 | ✅ passed passed | 2025-08-22 17:45:24 UTC | 2025-08-22 17:45:24 UTC | None | None |
| iSEE | 2.20.0 | ✅ passed passed | 2025-08-22 17:44:55 UTC | 2025-08-22 17:44:55 UTC | None | None |
| KEGGREST | 1.48.1 | ✅ passed passed | 2025-08-22 17:44:12 UTC | 2025-08-22 17:44:12 UTC | None | None |
| limma | 3.64.3 | ✅ passed passed | 2025-08-22 17:43:59 UTC | 2025-08-22 17:43:59 UTC | None | None |
| MatrixGenerics | 1.20.0 | ✅ passed passed | 2025-08-22 17:44:40 UTC | 2025-08-22 17:44:40 UTC | None | None |
| methylumi | 2.54.0 | ✅ passed passed | 2025-08-22 17:45:37 UTC | 2025-08-22 17:45:37 UTC | None | None |
| minfi | 1.54.1 | ✅ passed passed | 2025-08-22 17:44:23 UTC | 2025-08-22 17:44:23 UTC | None | None |
| monaLisa | 1.14.0 | ✅ passed passed | 2025-08-22 17:44:36 UTC | 2025-08-22 17:44:36 UTC | None | None |
| MultiAssayExperiment | 1.34.0 | ✅ passed passed | 2025-08-22 17:45:03 UTC | 2025-08-22 17:45:03 UTC | None | None |
| multtest | 2.64.0 | ✅ passed passed | 2025-08-22 17:46:08 UTC | 2025-08-22 17:46:08 UTC | None | None |
| ontoProc | 2.2.4 | ✅ passed passed | 2025-08-22 17:43:56 UTC | 2025-08-22 17:43:56 UTC | None | None |
| orthos | 1.6.0 | ✅ passed passed | 2025-08-22 17:44:34 UTC | 2025-08-22 17:44:34 UTC | None | None |
| parody | 1.66.1 | ✅ passed passed | 2025-08-22 17:44:13 UTC | 2025-08-22 17:44:13 UTC | None | None |
| plyranges | 1.28.0 | ✅ passed passed | 2025-08-22 17:44:50 UTC | 2025-08-22 17:44:50 UTC | None | None |
| plyxp | 1.2.7 | ✅ passed passed | 2025-08-22 17:43:57 UTC | 2025-08-22 17:43:57 UTC | None | None |
| preprocessCore | 1.70.0 | ✅ passed passed | 2025-08-22 17:46:06 UTC | 2025-08-22 17:46:06 UTC | None | None |
| ProtGenerics | 1.40.0 | ✅ passed passed | 2025-08-22 17:45:13 UTC | 2025-08-22 17:45:13 UTC | None | None |
| pwalign | 1.4.0 | ✅ passed passed | 2025-08-22 17:44:30 UTC | 2025-08-22 17:44:30 UTC | None | None |
| QuasR | 1.48.1 | ✅ passed passed | 2025-08-22 17:44:10 UTC | 2025-08-22 17:44:10 UTC | None | None |
| RBGL | 1.84.0 | ✅ passed passed | 2025-08-22 17:45:59 UTC | 2025-08-22 17:45:59 UTC | None | None |
| Rbowtie | 1.48.0 | ✅ passed passed | 2025-08-22 17:45:22 UTC | 2025-08-22 17:45:22 UTC | None | None |
| rhdf5 | 2.52.1 | ✅ passed passed | 2025-08-22 17:44:14 UTC | 2025-08-22 17:44:14 UTC | None | None |
| Rhdf5lib | 1.30.0 | ✅ passed passed | 2025-08-22 17:44:59 UTC | 2025-08-22 17:44:59 UTC | None | None |
| RProtoBufLib | 2.20.0 | ✅ passed passed | 2025-08-22 17:45:00 UTC | 2025-08-22 17:45:00 UTC | None | None |
| Rsamtools | 2.24.0 | ✅ passed passed | 2025-08-22 17:45:32 UTC | 2025-08-22 17:45:32 UTC | None | None |
| rtracklayer | 1.68.0 | ✅ passed passed | 2025-08-22 17:45:40 UTC | 2025-08-22 17:45:40 UTC | None | None |
| S4Arrays | 1.8.1 | ✅ passed passed | 2025-08-22 17:44:16 UTC | 2025-08-22 17:44:16 UTC | None | None |
| S4Vectors | 0.46.0 | ✅ passed passed | 2025-08-22 17:45:16 UTC | 2025-08-22 17:45:16 UTC | None | None |
| seqLogo | 1.74.0 | ✅ passed passed | 2025-08-22 17:45:42 UTC | 2025-08-22 17:45:42 UTC | None | None |
| ShortRead | 1.66.0 | ✅ passed passed | 2025-08-22 17:45:39 UTC | 2025-08-22 17:45:39 UTC | None | None |
| siggenes | 1.82.0 | ✅ passed passed | 2025-08-22 17:46:00 UTC | 2025-08-22 17:46:00 UTC | None | None |
| SingleCellExperiment | 1.30.1 | ✅ passed passed | 2025-08-22 17:44:27 UTC | 2025-08-22 17:44:27 UTC | None | None |
| sketchR | 1.4.0 | ✅ passed passed | 2025-08-22 17:44:33 UTC | 2025-08-22 17:44:33 UTC | None | None |
| SparseArray | 1.8.1 | ✅ passed passed | 2025-08-22 17:44:00 UTC | 2025-08-22 17:44:00 UTC | None | None |
| SRAdb | 1.70.0 | ✅ passed passed | 2025-08-22 17:45:30 UTC | 2025-08-22 17:45:30 UTC | None | None |
| SummarizedExperiment | 1.38.1 | ✅ passed passed | 2025-08-22 17:44:28 UTC | 2025-08-22 17:44:28 UTC | None | None |
| TFBSTools | 1.46.0 | ✅ passed passed | 2025-08-22 17:45:19 UTC | 2025-08-22 17:45:19 UTC | None | None |
| treeclimbR | 1.4.0 | ✅ passed passed | 2025-08-22 17:44:32 UTC | 2025-08-22 17:44:32 UTC | None | None |
| treeio | 1.32.0 | ✅ passed passed | 2025-08-22 17:45:02 UTC | 2025-08-22 17:45:02 UTC | None | None |
| txdbmaker | 1.4.2 | ✅ passed passed | 2025-08-22 17:44:09 UTC | 2025-08-22 17:44:09 UTC | None | None |
| tximeta | 1.26.1 | ✅ passed passed | 2025-08-22 17:44:19 UTC | 2025-08-22 17:44:19 UTC | None | None |
| tximport | 1.36.1 | ✅ passed passed | 2025-08-22 17:44:06 UTC | 2025-08-22 17:44:06 UTC | None | None |
| UCSC.utils | 1.4.0 | ✅ passed passed | 2025-08-22 17:44:31 UTC | 2025-08-22 17:44:31 UTC | None | None |
| VariantAnnotation | 1.54.1 | ✅ passed passed | 2025-08-22 17:44:21 UTC | 2025-08-22 17:44:21 UTC | None | None |
| vsn | 3.76.0 | ✅ passed passed | 2025-08-22 17:46:04 UTC | 2025-08-22 17:46:04 UTC | None | None |
| XVector | 0.48.0 | ✅ passed passed | 2025-08-22 17:45:20 UTC | 2025-08-22 17:45:20 UTC | None | None |

## Action Items

### High Priority
1. **Fix 21 failed packages** - These are blocking issues that need attention
   - **48 packages** with merge conflicts
   - **1 packages** with version number issues

---

*Generated by Bioconductor Gatekeeper System*  
*Report generated: 2025-08-22 19:20:41 UTC*  
*For detailed logs, check the `logs/` directory*

