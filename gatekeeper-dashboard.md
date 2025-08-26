# Bioconductor Gatekeeper Dashboard

**Last Updated:** 2025-08-26 16:34:15 UTC

## 📊 Quick Statistics

- **Total Packages:** 110
- **✅ Passed:** 94
- **❌ Failed:** 15
- **Pending:** 0
- **Never Checked:** 0

## ❌ Failed Packages

**15 packages are currently failing checks:**

| Package | Version | Last Check | Issues | Warnings |
|---------|---------|------------|--------|----------|
| **affyio** | 1.78.0 | 2025-08-22 19:27:54 UTC | Issues | None |
| **BiocVersion** | 3.21.1 | 2025-08-22 19:27:58 UTC | Issues | None |
| **Biostrings** | 2.76.0 | 2025-08-22 19:27:45 UTC | Issues | None |
| **BSgenome** | 1.76.0 | 2025-08-22 19:27:35 UTC | Issues | None |
| **ComplexHeatmap** | 2.24.1 | 2025-08-22 19:25:59 UTC | Issues | None |
| **flowCore** | 2.20.0 | 2025-08-22 19:27:34 UTC | Issues | None |
| **GenomicAlignments** | 1.44.0 | 2025-08-22 19:27:04 UTC | Issues | None |
| **GEOmetadb** | Unknown | Never | None | None |
| **GEOquery** | 2.76.0 | 2025-08-22 19:27:40 UTC | Issues | None |
| **HDF5Array** | 1.36.0 | 2025-08-22 19:26:52 UTC | Issues | None |
| **IHW** | 1.36.0 | 2025-08-22 19:26:54 UTC | Issues | None |
| **IRanges** | 2.42.0 | 2025-08-22 19:27:46 UTC | Issues | None |
| **lpsymphony** | 1.36.0 | 2025-08-22 19:26:56 UTC | Issues | None |
| **Rgraphviz** | 2.52.0 | 2025-08-22 19:27:49 UTC | Issues | None |
| **Rhtslib** | 3.4.0 | 2025-08-22 19:26:59 UTC | Issues | None |

### Detailed Failure Information

#### affyio

- **Version:** 1.78.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:54 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/read_generic.c (lines: 1465, 1467, 1471, 1476, 1526, 1528, 1533, 1540)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/read_generic.c (lines: 1465, 1467, 1471, 1476, 1526, 1528, 1533, 1540)

#### BiocVersion

- **Version:** 3.21.1
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:58 UTC
- **Issues:**
  - version: Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions
- **Failed Checks:**
  - **version:** 1 issues
    - Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions

#### Biostrings

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:45 UTC
- **Issues:**
  - large_files: inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)

#### BSgenome

- **Version:** 1.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:35 UTC
- **Issues:**
  - large_files: inst/extdata/ce2chrX.fa.gz (5.23 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/ce2chrX.fa.gz (5.23 MB)

#### ComplexHeatmap

- **Version:** 2.24.1
- **Status:** failed
- **Last Check:** 2025-08-22 19:25:59 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in extra/ComplexHeatmap.html (lines: 2419, 2450)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in extra/ComplexHeatmap.html (lines: 2419, 2450)

#### flowCore

- **Version:** 2.20.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:34 UTC
- **Issues:**
  - large_files: data/GvHD.rda (5.44 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - data/GvHD.rda (5.44 MB)

#### GenomicAlignments

- **Version:** 1.44.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:04 UTC
- **Issues:**
  - merge_markers: Merge marker '>>>>>>>' found in inst/doc/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
  - merge_markers: Merge marker '>>>>>>>' found in vignettes/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
- **Failed Checks:**
  - **merge_markers:** 2 issues
    - Merge marker '>>>>>>>' found in inst/doc/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)
    - Merge marker '>>>>>>>' found in vignettes/OverlapEncodings.Rnw (lines: 623, 629, 635, 655, 661, 779, 786, 793, 800, 807, 1366, 1372, 1378, 1456, 1463, 1470)

#### GEOmetadb

- **Version:** Unknown
- **Status:** failed
- **Last Check:** Never

#### GEOquery

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:40 UTC
- **Issues:**
  - large_files: inst/extdata/GSE781_family.soft.gz (9.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/GSE781_family.soft.gz (9.67 MB)

#### HDF5Array

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:26:52 UTC
- **Issues:**
  - large_files: inst/extdata/toy.h5 (7.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/toy.h5 (7.67 MB)

#### IHW

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:26:54 UTC
- **Issues:**
  - large_files: inst/doc/introduction_to_ihw.html (5.18 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/doc/introduction_to_ihw.html (5.18 MB)

#### IRanges

- **Version:** 2.42.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:46 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/NCList.c (lines: 294, 304, 312, 322)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/NCList.c (lines: 294, 304, 312, 322)

#### lpsymphony

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:26:56 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/MPP/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP+CUTS/testing (lines: 6)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/USER/testing (lines: 13)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/VRP/testing (lines: 10)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/scripts/compile_all (lines: 6, 10)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/scripts/compile_and_clean_all (lines: 6, 11)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/src/Master/master_io.c (lines: 135, 827, 830, 841, 860, 896, 917, 926, 950, 959, 968, 977, 1076, 1180)
  - merge_markers: Merge marker '=======' found in src/SYMPHONY/SYMPHONY/src/Master/master.c (lines: 1508)
  - large_files: src/WinLib/i386/lpsymphony.dll (5.39 MB)
  - large_files: src/WinLib/x64/lpsymphony.dll (6.71 MB)
- **Failed Checks:**
  - **merge_markers:** 9 issues
    - Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/MPP/testing (lines: 6)
    - Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP/testing (lines: 6)
    - Merge marker '=======' found in src/SYMPHONY/SYMPHONY/Applications/SPP+CUTS/testing (lines: 6)
    - ... and 6 more issues
  - **large_files:** 2 issues
    - src/WinLib/i386/lpsymphony.dll (5.39 MB)
    - src/WinLib/x64/lpsymphony.dll (6.71 MB)

#### Rgraphviz

- **Version:** 2.52.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:27:49 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/graphviz/lib/sparse/IntStack.c (lines: 77)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/graphviz/lib/sparse/IntStack.c (lines: 77)

#### Rhtslib

- **Version:** 3.4.0
- **Status:** failed
- **Last Check:** 2025-08-22 19:26:59 UTC
- **Issues:**
  - merge_markers: Merge marker '=======' found in src/htslib-1.18/hts.c (lines: 2177, 2193)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Merge marker '=======' found in src/htslib-1.18/hts.c (lines: 2177, 2193)

## Status Breakdown

### All Packages Status

| Package | Version | Status | Last Check | Last Success | Issues | Warnings |
|---------|---------|--------|------------|--------------|--------|----------|
| affyio | 1.78.0 | ❌ failed failed | 2025-08-22 19:27:54 UTC | Never | Issues | None |
| BiocVersion | 3.21.1 | ❌ failed failed | 2025-08-22 19:27:58 UTC | Never | Issues | None |
| Biostrings | 2.76.0 | ❌ failed failed | 2025-08-22 19:27:45 UTC | Never | Issues | None |
| BSgenome | 1.76.0 | ❌ failed failed | 2025-08-22 19:27:35 UTC | Never | Issues | None |
| ComplexHeatmap | 2.24.1 | ❌ failed failed | 2025-08-22 19:25:59 UTC | Never | Issues | None |
| flowCore | 2.20.0 | ❌ failed failed | 2025-08-22 19:27:34 UTC | Never | Issues | None |
| GenomicAlignments | 1.44.0 | ❌ failed failed | 2025-08-22 19:27:04 UTC | Never | Issues | None |
| GEOmetadb | Unknown | ❌ failed failed | Never | Never | None | None |
| GEOquery | 2.76.0 | ❌ failed failed | 2025-08-22 19:27:40 UTC | Never | Issues | None |
| HDF5Array | 1.36.0 | ❌ failed failed | 2025-08-22 19:26:52 UTC | Never | Issues | None |
| IHW | 1.36.0 | ❌ failed failed | 2025-08-22 19:26:54 UTC | Never | Issues | None |
| IRanges | 2.42.0 | ❌ failed failed | 2025-08-22 19:27:46 UTC | Never | Issues | None |
| lpsymphony | 1.36.0 | ❌ failed failed | 2025-08-22 19:26:56 UTC | Never | Issues | None |
| Rgraphviz | 2.52.0 | ❌ failed failed | 2025-08-22 19:27:49 UTC | Never | Issues | None |
| Rhtslib | 3.4.0 | ❌ failed failed | 2025-08-22 19:26:59 UTC | Never | Issues | None |
| affy | 1.86.0 | ✅ passed passed | 2025-08-22 19:27:52 UTC | 2025-08-22 19:27:52 UTC | None | None |
| alevinQC | 1.24.0 | ✅ passed passed | 2025-08-22 19:26:39 UTC | 2025-08-22 19:26:39 UTC | None | None |
| annotate | 1.86.1 | ✅ passed passed | 2025-08-22 19:26:03 UTC | 2025-08-22 19:26:03 UTC | None | None |
| AnnotationDbi | 1.70.0 | ✅ passed passed | 2025-08-22 19:27:31 UTC | 2025-08-22 19:27:31 UTC | None | None |
| AnnotationFilter | 1.32.0 | ✅ passed passed | 2025-08-22 19:26:49 UTC | 2025-08-22 19:26:49 UTC | None | None |
| AnnotationHub | 3.16.1 | ✅ passed passed | 2025-08-22 19:25:53 UTC | 2025-08-22 19:25:53 UTC | None | None |
| basilisk | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:35 UTC | 2025-08-22 19:26:35 UTC | None | None |
| basilisk.utils | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:34 UTC | 2025-08-22 19:26:34 UTC | None | None |
| Biobase | 2.68.0 | ✅ passed passed | 2025-08-22 19:27:57 UTC | 2025-08-22 19:27:57 UTC | None | None |
| BiocBaseUtils | 1.10.0 | ✅ passed passed | 2025-08-22 19:26:27 UTC | 2025-08-22 19:26:27 UTC | None | None |
| BiocFileCache | 2.16.2 | ✅ passed passed | 2025-08-25 12:57:38 UTC | 2025-08-25 12:57:38 UTC | None | None |
| BiocGenerics | 0.54.0 | ✅ passed passed | 2025-08-22 19:27:14 UTC | 2025-08-22 19:27:14 UTC | None | None |
| BiocIO | 1.18.0 | ✅ passed passed | 2025-08-22 19:26:30 UTC | 2025-08-22 19:26:30 UTC | None | None |
| BiocParallel | 1.42.1 | ✅ passed passed | 2025-08-22 19:26:08 UTC | 2025-08-22 19:26:08 UTC | None | None |
| BiocPkgTools | 1.26.3 | ✅ passed passed | 2025-08-22 19:25:40 UTC | 2025-08-22 19:25:40 UTC | None | None |
| BiocStyle | 2.36.0 | ✅ passed passed | 2025-08-22 19:27:06 UTC | 2025-08-22 19:27:06 UTC | None | None |
| biocViews | 1.76.0 | ✅ passed passed | 2025-08-22 19:27:41 UTC | 2025-08-22 19:27:41 UTC | None | None |
| biomaRt | 2.64.0 | ✅ passed passed | 2025-08-22 19:27:42 UTC | 2025-08-22 19:27:42 UTC | None | None |
| biovizBase | 1.56.0 | ✅ passed passed | 2025-08-22 19:27:16 UTC | 2025-08-22 19:27:16 UTC | None | None |
| bumphunter | 1.50.0 | ✅ passed passed | 2025-08-22 19:27:10 UTC | 2025-08-22 19:27:10 UTC | None | None |
| ConsensusClusterPlus | 1.72.0 | ✅ passed passed | 2025-08-22 19:27:19 UTC | 2025-08-22 19:27:19 UTC | None | None |
| cytolib | 2.20.0 | ✅ passed passed | 2025-08-22 19:26:46 UTC | 2025-08-22 19:26:46 UTC | None | None |
| DelayedArray | 0.34.1 | ✅ passed passed | 2025-08-22 19:26:20 UTC | 2025-08-22 19:26:20 UTC | None | None |
| DelayedMatrixStats | 1.30.0 | ✅ passed passed | 2025-08-22 19:26:44 UTC | 2025-08-22 19:26:44 UTC | None | None |
| DESeq2 | 1.48.2 | ✅ passed passed | 2025-08-22 19:25:42 UTC | 2025-08-22 19:25:42 UTC | None | None |
| diffcyt | 1.28.0 | ✅ passed passed | 2025-08-22 19:26:40 UTC | 2025-08-22 19:26:40 UTC | None | None |
| dir.expiry | 1.16.0 | ✅ passed passed | 2025-08-22 19:26:29 UTC | 2025-08-22 19:26:29 UTC | None | None |
| DirichletMultinomial | 1.50.0 | ✅ passed passed | 2025-08-22 19:27:12 UTC | 2025-08-22 19:27:12 UTC | None | None |
| EBImage | 4.50.0 | ✅ passed passed | 2025-08-22 19:27:37 UTC | 2025-08-22 19:27:37 UTC | None | None |
| edgeR | 4.6.3 | ✅ passed passed | 2025-08-22 19:25:57 UTC | 2025-08-22 19:25:57 UTC | None | None |
| ensembldb | 2.32.0 | ✅ passed passed | 2025-08-22 19:26:58 UTC | 2025-08-22 19:26:58 UTC | None | None |
| ExperimentHub | 2.16.1 | ✅ passed passed | 2025-08-22 19:25:55 UTC | 2025-08-22 19:25:55 UTC | None | None |
| ExploreModelMatrix | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:31 UTC | 2025-08-22 19:26:31 UTC | None | None |
| FlowSOM | 2.16.0 | ✅ passed passed | 2025-08-22 19:27:02 UTC | 2025-08-22 19:27:02 UTC | None | None |
| genefilter | 1.90.0 | ✅ passed passed | 2025-08-22 19:27:56 UTC | 2025-08-22 19:27:56 UTC | None | None |
| GenomeInfoDb | 1.44.2 | ✅ passed passed | 2025-08-22 19:25:43 UTC | 2025-08-22 19:25:43 UTC | None | None |
| GenomicDataCommons | 1.32.1 | ✅ passed passed | 2025-08-22 19:26:10 UTC | 2025-08-22 19:26:10 UTC | None | None |
| GenomicFeatures | 1.60.0 | ✅ passed passed | 2025-08-22 19:27:20 UTC | 2025-08-22 19:27:20 UTC | None | None |
| GenomicFiles | 1.44.1 | ✅ passed passed | 2025-08-22 19:26:17 UTC | 2025-08-22 19:26:17 UTC | None | None |
| GenomicRanges | 1.60.0 | ✅ passed passed | 2025-08-22 19:27:19 UTC | 2025-08-22 19:27:19 UTC | None | None |
| GenomicSuperSignature | 1.16.1 | ✅ passed passed | 2025-08-22 19:26:16 UTC | 2025-08-22 19:26:16 UTC | None | None |
| ggtree | 3.16.3 | ✅ passed passed | 2025-08-22 19:25:56 UTC | 2025-08-22 19:25:56 UTC | None | None |
| graph | 1.86.0 | ✅ passed passed | 2025-08-22 19:27:50 UTC | 2025-08-22 19:27:50 UTC | None | None |
| Gviz | 1.52.0 | ✅ passed passed | 2025-08-22 19:27:13 UTC | 2025-08-22 19:27:13 UTC | None | None |
| h5mread | 1.0.1 | ✅ passed passed | 2025-08-22 19:26:09 UTC | 2025-08-22 19:26:09 UTC | None | None |
| illuminaio | 0.50.0 | ✅ passed passed | 2025-08-22 19:27:11 UTC | 2025-08-22 19:27:11 UTC | None | None |
| iSEE | 2.20.0 | ✅ passed passed | 2025-08-22 19:26:44 UTC | 2025-08-22 19:26:44 UTC | None | None |
| KEGGREST | 1.48.1 | ✅ passed passed | 2025-08-22 19:26:04 UTC | 2025-08-22 19:26:04 UTC | None | None |
| limma | 3.64.3 | ✅ passed passed | 2025-08-22 19:25:51 UTC | 2025-08-22 19:25:51 UTC | None | None |
| MatrixGenerics | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:31 UTC | 2025-08-22 19:26:31 UTC | None | None |
| methylumi | 2.54.0 | ✅ passed passed | 2025-08-22 19:27:22 UTC | 2025-08-22 19:27:22 UTC | None | None |
| minfi | 1.54.1 | ✅ passed passed | 2025-08-22 19:26:15 UTC | 2025-08-22 19:26:15 UTC | None | None |
| monaLisa | 1.14.0 | ✅ passed passed | 2025-08-22 19:26:28 UTC | 2025-08-22 19:26:28 UTC | None | None |
| MultiAssayExperiment | 1.34.0 | ✅ passed passed | 2025-08-22 19:26:51 UTC | 2025-08-22 19:26:51 UTC | None | None |
| multtest | 2.64.0 | ✅ passed passed | 2025-08-22 19:27:55 UTC | 2025-08-22 19:27:55 UTC | None | None |
| ontoProc | 2.2.4 | ✅ passed passed | 2025-08-22 19:25:48 UTC | 2025-08-22 19:25:48 UTC | None | None |
| orthos | 1.6.0 | ✅ passed passed | 2025-08-22 19:26:26 UTC | 2025-08-22 19:26:26 UTC | None | None |
| parody | 1.66.1 | ✅ passed passed | 2025-08-22 19:26:05 UTC | 2025-08-22 19:26:05 UTC | None | None |
| plyranges | 1.28.0 | ✅ passed passed | 2025-08-22 19:26:41 UTC | 2025-08-22 19:26:41 UTC | None | None |
| plyxp | 1.2.7 | ✅ passed passed | 2025-08-22 19:25:49 UTC | 2025-08-22 19:25:49 UTC | None | None |
| preprocessCore | 1.70.0 | ✅ passed passed | 2025-08-22 19:27:53 UTC | 2025-08-22 19:27:53 UTC | None | None |
| ProtGenerics | 1.40.0 | ✅ passed passed | 2025-08-22 19:27:00 UTC | 2025-08-22 19:27:00 UTC | None | None |
| pwalign | 1.4.0 | ✅ passed passed | 2025-08-22 19:26:21 UTC | 2025-08-22 19:26:21 UTC | None | None |
| QuasR | 1.48.1 | ✅ passed passed | 2025-08-22 19:26:02 UTC | 2025-08-22 19:26:02 UTC | None | None |
| RBGL | 1.84.0 | ✅ passed passed | 2025-08-22 19:27:47 UTC | 2025-08-22 19:27:47 UTC | None | None |
| Rbowtie | 1.48.0 | ✅ passed passed | 2025-08-22 19:27:08 UTC | 2025-08-22 19:27:08 UTC | None | None |
| rhdf5 | 2.52.1 | ✅ passed passed | 2025-08-22 19:26:06 UTC | 2025-08-22 19:26:06 UTC | None | None |
| rhdf5filters | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:33 UTC | 2025-08-22 19:26:33 UTC | None | None |
| Rhdf5lib | 1.30.0 | ✅ passed passed | 2025-08-22 19:26:47 UTC | 2025-08-22 19:26:47 UTC | None | None |
| RProtoBufLib | 2.20.0 | ✅ passed passed | 2025-08-22 19:26:48 UTC | 2025-08-22 19:26:48 UTC | None | None |
| Rsamtools | 2.24.0 | ✅ passed passed | 2025-08-22 19:27:18 UTC | 2025-08-22 19:27:18 UTC | None | None |
| rtracklayer | 1.68.0 | ✅ passed passed | 2025-08-22 19:27:25 UTC | 2025-08-22 19:27:25 UTC | None | None |
| S4Arrays | 1.8.1 | ✅ passed passed | 2025-08-22 19:26:08 UTC | 2025-08-22 19:26:08 UTC | None | None |
| S4Vectors | 0.46.0 | ✅ passed passed | 2025-08-22 19:27:03 UTC | 2025-08-22 19:27:03 UTC | None | None |
| seqLogo | 1.74.0 | ✅ passed passed | 2025-08-22 19:27:26 UTC | 2025-08-22 19:27:26 UTC | None | None |
| ShortRead | 1.66.0 | ✅ passed passed | 2025-08-22 19:27:24 UTC | 2025-08-22 19:27:24 UTC | None | None |
| siggenes | 1.82.0 | ✅ passed passed | 2025-08-22 19:27:48 UTC | 2025-08-22 19:27:48 UTC | None | None |
| SingleCellExperiment | 1.30.1 | ✅ passed passed | 2025-08-22 19:26:18 UTC | 2025-08-22 19:26:18 UTC | None | None |
| sketchR | 1.4.0 | ✅ passed passed | 2025-08-22 19:26:24 UTC | 2025-08-22 19:26:24 UTC | None | None |
| SparseArray | 1.8.1 | ✅ passed passed | 2025-08-22 19:25:52 UTC | 2025-08-22 19:25:52 UTC | None | None |
| sparseMatrixStats | 1.20.0 | ✅ passed passed | 2025-08-22 19:26:32 UTC | 2025-08-22 19:26:32 UTC | None | None |
| SRAdb | 1.70.0 | ✅ passed passed | 2025-08-22 19:27:17 UTC | 2025-08-22 19:27:17 UTC | None | None |
| SummarizedExperiment | 1.38.1 | ✅ passed passed | 2025-08-22 19:26:19 UTC | 2025-08-22 19:26:19 UTC | None | None |
| TFBSTools | 1.46.0 | ✅ passed passed | 2025-08-22 19:27:06 UTC | 2025-08-22 19:27:06 UTC | None | None |
| treeclimbR | 1.4.0 | ✅ passed passed | 2025-08-22 19:26:22 UTC | 2025-08-22 19:26:22 UTC | None | None |
| treeio | 1.32.0 | ✅ passed passed | 2025-08-22 19:26:50 UTC | 2025-08-22 19:26:50 UTC | None | None |
| TreeSummarizedExperiment | 2.16.1 | ✅ passed passed | 2025-08-22 19:26:13 UTC | 2025-08-22 19:26:13 UTC | None | None |
| txdbmaker | 1.4.2 | ✅ passed passed | 2025-08-22 19:26:00 UTC | 2025-08-22 19:26:00 UTC | None | None |
| tximeta | 1.26.1 | ✅ passed passed | 2025-08-22 19:26:11 UTC | 2025-08-22 19:26:11 UTC | None | None |
| tximport | 1.36.1 | ✅ passed passed | 2025-08-22 19:25:58 UTC | 2025-08-22 19:25:58 UTC | None | None |
| UCSC.utils | 1.4.0 | ✅ passed passed | 2025-08-22 19:26:22 UTC | 2025-08-22 19:26:22 UTC | None | None |
| VariantAnnotation | 1.54.1 | ✅ passed passed | 2025-08-22 19:26:13 UTC | 2025-08-22 19:26:13 UTC | None | None |
| vsn | 3.76.0 | ✅ passed passed | 2025-08-22 19:27:51 UTC | 2025-08-22 19:27:51 UTC | None | None |
| XVector | 0.48.0 | ✅ passed passed | 2025-08-22 19:27:07 UTC | 2025-08-22 19:27:07 UTC | None | None |

## Action Items

### High Priority
1. **Fix 15 failed packages** - These are blocking issues that need attention
   - **16 packages** with merge conflicts
   - **1 packages** with version number issues

---

*Generated by Bioconductor Gatekeeper System*  
*Report generated: 2025-08-26 16:34:15 UTC*  
*For detailed logs, check the `logs/` directory*

