# Bioconductor Gatekeeper Dashboard

**Last Updated:** 2025-09-03 18:37:03 UTC

## 📊 Quick Statistics

- **Total Packages:** 110
- **✅ Passed:** 98
- **❌ Failed:** 11
- **Pending:** 0
- **Never Checked:** 0

## ❌ Failed Packages

**11 packages are currently failing checks:**

| Package | Version | Last Check | Issues | Warnings |
|---------|---------|------------|--------|----------|
| **BiocVersion** | 3.21.1 | 2025-09-03 18:21:00 UTC | Issues | None |
| **Biostrings** | 2.76.0 | 2025-09-03 18:20:33 UTC | Issues | None |
| **BSgenome** | 1.76.0 | 2025-09-03 18:20:09 UTC | Issues | None |
| **flowCore** | 2.20.0 | 2025-09-03 18:20:01 UTC | Issues | None |
| **GEOmetadb** | Unknown | Never | None | None |
| **GEOquery** | 2.76.0 | 2025-09-03 18:20:30 UTC | Issues | None |
| **HDF5Array** | 1.36.0 | 2025-09-03 18:17:55 UTC | Issues | None |
| **IHW** | 1.36.0 | 2025-09-03 18:17:56 UTC | Issues | None |
| **lpsymphony** | 1.36.0 | 2025-09-03 18:18:15 UTC | Issues | None |
| **Rgraphviz** | 2.52.0 | 2025-09-03 18:20:44 UTC | Issues | None |
| **txdbmaker** | 1.4.2 | 2025-09-03 18:16:24 UTC | Issues | None |

### Detailed Failure Information

#### BiocVersion

- **Version:** 3.21.1
- **Status:** failed
- **Last Check:** 2025-09-03 18:21:00 UTC
- **Issues:**
  - version: Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions
- **Failed Checks:**
  - **version:** 1 issues
    - Version 3.21.1 minor number 21 is odd, but Bioconductor release expects even minor versions

#### Biostrings

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:20:33 UTC
- **Issues:**
  - large_files: inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/dm3_upstream2000.fa.gz (10.99 MB)

#### BSgenome

- **Version:** 1.76.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:20:09 UTC
- **Issues:**
  - large_files: inst/extdata/ce2chrX.fa.gz (5.23 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/ce2chrX.fa.gz (5.23 MB)

#### flowCore

- **Version:** 2.20.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:20:01 UTC
- **Issues:**
  - large_files: data/GvHD.rda (5.44 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - data/GvHD.rda (5.44 MB)

#### GEOmetadb

- **Version:** Unknown
- **Status:** failed
- **Last Check:** Never

#### GEOquery

- **Version:** 2.76.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:20:30 UTC
- **Issues:**
  - large_files: inst/extdata/GSE781_family.soft.gz (9.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/GSE781_family.soft.gz (9.67 MB)

#### HDF5Array

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:17:55 UTC
- **Issues:**
  - large_files: inst/extdata/toy.h5 (7.67 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/extdata/toy.h5 (7.67 MB)

#### IHW

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:17:56 UTC
- **Issues:**
  - large_files: inst/doc/introduction_to_ihw.html (5.18 MB)
- **Failed Checks:**
  - **large_files:** 1 issues
    - inst/doc/introduction_to_ihw.html (5.18 MB)

#### lpsymphony

- **Version:** 1.36.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:18:15 UTC
- **Issues:**
  - merge_markers: Git conflict separator '=======' found in src/SYMPHONY/Cgl/README (line 50)
  - merge_markers: Git conflict separator '=======' found in src/SYMPHONY/Osi/README (line 53)
  - large_files: src/WinLib/i386/lpsymphony.dll (5.39 MB)
  - large_files: src/WinLib/x64/lpsymphony.dll (6.71 MB)
- **Failed Checks:**
  - **merge_markers:** 2 issues
    - Git conflict separator '=======' found in src/SYMPHONY/Cgl/README (line 50)
    - Git conflict separator '=======' found in src/SYMPHONY/Osi/README (line 53)
  - **large_files:** 2 issues
    - src/WinLib/i386/lpsymphony.dll (5.39 MB)
    - src/WinLib/x64/lpsymphony.dll (6.71 MB)

#### Rgraphviz

- **Version:** 2.52.0
- **Status:** failed
- **Last Check:** 2025-09-03 18:20:44 UTC
- **Issues:**
  - merge_markers: Git conflict separator '=======' found in inst/prepare/README (line 99)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Git conflict separator '=======' found in inst/prepare/README (line 99)

#### txdbmaker

- **Version:** 1.4.2
- **Status:** failed
- **Last Check:** 2025-09-03 18:16:24 UTC
- **Issues:**
  - merge_markers: Git conflict separator '=======' found in inst/extdata/README.txt (line 7)
- **Failed Checks:**
  - **merge_markers:** 1 issues
    - Git conflict separator '=======' found in inst/extdata/README.txt (line 7)

## Status Breakdown

### All Packages Status

| Package | Version | Status | Last Check | Last Success | Issues | Warnings |
|---------|---------|--------|------------|--------------|--------|----------|
| BiocVersion | 3.21.1 | ❌ failed failed | 2025-09-03 18:21:00 UTC | Never | Issues | None |
| Biostrings | 2.76.0 | ❌ failed failed | 2025-09-03 18:20:33 UTC | Never | Issues | None |
| BSgenome | 1.76.0 | ❌ failed failed | 2025-09-03 18:20:09 UTC | Never | Issues | None |
| flowCore | 2.20.0 | ❌ failed failed | 2025-09-03 18:20:01 UTC | Never | Issues | None |
| GEOmetadb | Unknown | ❌ failed failed | Never | Never | None | None |
| GEOquery | 2.76.0 | ❌ failed failed | 2025-09-03 18:20:30 UTC | Never | Issues | None |
| HDF5Array | 1.36.0 | ❌ failed failed | 2025-09-03 18:17:55 UTC | Never | Issues | None |
| IHW | 1.36.0 | ❌ failed failed | 2025-09-03 18:17:56 UTC | Never | Issues | None |
| lpsymphony | 1.36.0 | ❌ failed failed | 2025-09-03 18:18:15 UTC | Never | Issues | None |
| Rgraphviz | 2.52.0 | ❌ failed failed | 2025-09-03 18:20:44 UTC | Never | Issues | None |
| txdbmaker | 1.4.2 | ❌ failed failed | 2025-09-03 18:16:24 UTC | 2025-08-22 19:26:00 UTC | Issues | None |
| affy | 1.86.0 | ✅ passed passed | 2025-09-03 18:20:49 UTC | 2025-09-03 18:20:49 UTC | None | None |
| affyio | 1.78.0 | ✅ passed passed | 2025-09-03 18:20:50 UTC | 2025-09-03 18:20:50 UTC | None | None |
| alevinQC | 1.24.0 | ✅ passed passed | 2025-09-03 18:17:27 UTC | 2025-09-03 18:17:27 UTC | None | None |
| annotate | 1.86.1 | ✅ passed passed | 2025-09-03 18:16:29 UTC | 2025-09-03 18:16:29 UTC | None | None |
| AnnotationDbi | 1.70.0 | ✅ passed passed | 2025-09-03 18:19:38 UTC | 2025-09-03 18:19:38 UTC | None | None |
| AnnotationFilter | 1.32.0 | ✅ passed passed | 2025-09-03 18:17:42 UTC | 2025-09-03 18:17:42 UTC | None | None |
| AnnotationHub | 3.16.1 | ✅ passed passed | 2025-09-03 18:16:14 UTC | 2025-09-03 18:16:14 UTC | None | None |
| basilisk | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:12 UTC | 2025-09-03 18:17:12 UTC | None | None |
| basilisk.utils | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:11 UTC | 2025-09-03 18:17:11 UTC | None | None |
| Biobase | 2.68.0 | ✅ passed passed | 2025-09-03 18:20:59 UTC | 2025-09-03 18:20:59 UTC | None | None |
| BiocBaseUtils | 1.10.0 | ✅ passed passed | 2025-09-03 18:16:58 UTC | 2025-09-03 18:16:58 UTC | None | None |
| BiocFileCache | 2.16.2 | ✅ passed passed | 2025-09-03 18:15:28 UTC | 2025-09-03 18:15:28 UTC | None | None |
| BiocGenerics | 0.54.0 | ✅ passed passed | 2025-09-03 18:19:01 UTC | 2025-09-03 18:19:01 UTC | None | None |
| BiocIO | 1.18.0 | ✅ passed passed | 2025-09-03 18:17:06 UTC | 2025-09-03 18:17:06 UTC | None | None |
| BiocParallel | 1.42.1 | ✅ passed passed | 2025-09-03 18:16:33 UTC | 2025-09-03 18:16:33 UTC | None | None |
| BiocPkgTools | 1.26.3 | ✅ passed passed | 2025-09-03 18:15:29 UTC | 2025-09-03 18:15:29 UTC | None | None |
| BiocStyle | 2.36.0 | ✅ passed passed | 2025-09-03 18:18:35 UTC | 2025-09-03 18:18:35 UTC | None | None |
| biocViews | 1.76.0 | ✅ passed passed | 2025-09-03 18:20:30 UTC | 2025-09-03 18:20:30 UTC | None | None |
| biomaRt | 2.64.0 | ✅ passed passed | 2025-09-03 18:20:31 UTC | 2025-09-03 18:20:31 UTC | None | None |
| biovizBase | 1.56.0 | ✅ passed passed | 2025-09-03 18:19:03 UTC | 2025-09-03 18:19:03 UTC | None | None |
| bumphunter | 1.50.0 | ✅ passed passed | 2025-09-03 18:18:53 UTC | 2025-09-03 18:18:53 UTC | None | None |
| ComplexHeatmap | 2.24.1 | ✅ passed passed | 2025-09-03 18:16:20 UTC | 2025-09-03 18:16:20 UTC | None | None |
| ConsensusClusterPlus | 1.72.0 | ✅ passed passed | 2025-09-03 18:19:06 UTC | 2025-09-03 18:19:06 UTC | None | None |
| cytolib | 2.20.0 | ✅ passed passed | 2025-09-03 18:17:40 UTC | 2025-09-03 18:17:40 UTC | None | None |
| DelayedArray | 0.34.1 | ✅ passed passed | 2025-09-03 18:16:53 UTC | 2025-09-03 18:16:53 UTC | None | None |
| DelayedMatrixStats | 1.30.0 | ✅ passed passed | 2025-09-03 18:17:32 UTC | 2025-09-03 18:17:32 UTC | None | None |
| DESeq2 | 1.48.2 | ✅ passed passed | 2025-09-03 18:15:30 UTC | 2025-09-03 18:15:30 UTC | None | None |
| diffcyt | 1.28.0 | ✅ passed passed | 2025-09-03 18:17:28 UTC | 2025-09-03 18:17:28 UTC | None | None |
| dir.expiry | 1.16.0 | ✅ passed passed | 2025-09-03 18:17:06 UTC | 2025-09-03 18:17:06 UTC | None | None |
| DirichletMultinomial | 1.50.0 | ✅ passed passed | 2025-09-03 18:18:55 UTC | 2025-09-03 18:18:55 UTC | None | None |
| EBImage | 4.50.0 | ✅ passed passed | 2025-09-03 18:20:11 UTC | 2025-09-03 18:20:11 UTC | None | None |
| edgeR | 4.6.3 | ✅ passed passed | 2025-09-03 18:16:17 UTC | 2025-09-03 18:16:17 UTC | None | None |
| ensembldb | 2.32.0 | ✅ passed passed | 2025-09-03 18:18:18 UTC | 2025-09-03 18:18:18 UTC | None | None |
| ExperimentHub | 2.16.1 | ✅ passed passed | 2025-09-03 18:16:14 UTC | 2025-09-03 18:16:14 UTC | None | None |
| ExploreModelMatrix | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:07 UTC | 2025-09-03 18:17:07 UTC | None | None |
| FlowSOM | 2.16.0 | ✅ passed passed | 2025-09-03 18:18:30 UTC | 2025-09-03 18:18:30 UTC | None | None |
| genefilter | 1.90.0 | ✅ passed passed | 2025-09-03 18:20:53 UTC | 2025-09-03 18:20:53 UTC | None | None |
| GenomeInfoDb | 1.44.2 | ✅ passed passed | 2025-09-03 18:15:32 UTC | 2025-09-03 18:15:32 UTC | None | None |
| GenomicAlignments | 1.44.0 | ✅ passed passed | 2025-09-03 18:18:34 UTC | 2025-09-03 18:18:34 UTC | None | None |
| GenomicDataCommons | 1.32.1 | ✅ passed passed | 2025-09-03 18:16:38 UTC | 2025-09-03 18:16:38 UTC | None | None |
| GenomicFeatures | 1.60.0 | ✅ passed passed | 2025-09-03 18:19:07 UTC | 2025-09-03 18:19:07 UTC | None | None |
| GenomicFiles | 1.44.1 | ✅ passed passed | 2025-09-03 18:16:50 UTC | 2025-09-03 18:16:50 UTC | None | None |
| GenomicRanges | 1.60.0 | ✅ passed passed | 2025-09-03 18:19:06 UTC | 2025-09-03 18:19:06 UTC | None | None |
| GenomicSuperSignature | 1.16.1 | ✅ passed passed | 2025-09-03 18:16:49 UTC | 2025-09-03 18:16:49 UTC | None | None |
| ggtree | 3.16.3 | ✅ passed passed | 2025-09-03 18:16:15 UTC | 2025-09-03 18:16:15 UTC | None | None |
| graph | 1.86.0 | ✅ passed passed | 2025-09-03 18:20:46 UTC | 2025-09-03 18:20:46 UTC | None | None |
| Gviz | 1.52.0 | ✅ passed passed | 2025-09-03 18:19:00 UTC | 2025-09-03 18:19:00 UTC | None | None |
| h5mread | 1.0.1 | ✅ passed passed | 2025-09-03 18:16:38 UTC | 2025-09-03 18:16:38 UTC | None | None |
| illuminaio | 0.50.0 | ✅ passed passed | 2025-09-03 18:18:54 UTC | 2025-09-03 18:18:54 UTC | None | None |
| IRanges | 2.42.0 | ✅ passed passed | 2025-09-03 18:20:35 UTC | 2025-09-03 18:20:35 UTC | None | None |
| iSEE | 2.20.0 | ✅ passed passed | 2025-09-03 18:17:31 UTC | 2025-09-03 18:17:31 UTC | None | None |
| KEGGREST | 1.48.1 | ✅ passed passed | 2025-09-03 18:16:30 UTC | 2025-09-03 18:16:30 UTC | None | None |
| limma | 3.64.3 | ✅ passed passed | 2025-09-03 18:16:12 UTC | 2025-09-03 18:16:12 UTC | None | None |
| MatrixGenerics | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:08 UTC | 2025-09-03 18:17:08 UTC | None | None |
| methylumi | 2.54.0 | ✅ passed passed | 2025-09-03 18:19:22 UTC | 2025-09-03 18:19:22 UTC | None | None |
| minfi | 1.54.1 | ✅ passed passed | 2025-09-03 18:16:43 UTC | 2025-09-03 18:16:43 UTC | None | None |
| monaLisa | 1.14.0 | ✅ passed passed | 2025-09-03 18:17:05 UTC | 2025-09-03 18:17:05 UTC | None | None |
| MultiAssayExperiment | 1.34.0 | ✅ passed passed | 2025-09-03 18:17:45 UTC | 2025-09-03 18:17:45 UTC | None | None |
| multtest | 2.64.0 | ✅ passed passed | 2025-09-03 18:20:53 UTC | 2025-09-03 18:20:53 UTC | None | None |
| ontoProc | 2.2.4 | ✅ passed passed | 2025-09-03 18:16:09 UTC | 2025-09-03 18:16:09 UTC | None | None |
| orthos | 1.6.0 | ✅ passed passed | 2025-09-03 18:16:57 UTC | 2025-09-03 18:16:57 UTC | None | None |
| parody | 1.66.1 | ✅ passed passed | 2025-09-03 18:16:30 UTC | 2025-09-03 18:16:30 UTC | None | None |
| plyranges | 1.28.0 | ✅ passed passed | 2025-09-03 18:17:29 UTC | 2025-09-03 18:17:29 UTC | None | None |
| plyxp | 1.2.7 | ✅ passed passed | 2025-09-03 18:16:10 UTC | 2025-09-03 18:16:10 UTC | None | None |
| preprocessCore | 1.70.0 | ✅ passed passed | 2025-09-03 18:20:50 UTC | 2025-09-03 18:20:50 UTC | None | None |
| ProtGenerics | 1.40.0 | ✅ passed passed | 2025-09-03 18:18:27 UTC | 2025-09-03 18:18:27 UTC | None | None |
| pwalign | 1.4.0 | ✅ passed passed | 2025-09-03 18:16:54 UTC | 2025-09-03 18:16:54 UTC | None | None |
| QuasR | 1.48.1 | ✅ passed passed | 2025-09-03 18:16:28 UTC | 2025-09-03 18:16:28 UTC | None | None |
| RBGL | 1.84.0 | ✅ passed passed | 2025-09-03 18:20:36 UTC | 2025-09-03 18:20:36 UTC | None | None |
| Rbowtie | 1.48.0 | ✅ passed passed | 2025-09-03 18:18:38 UTC | 2025-09-03 18:18:38 UTC | None | None |
| rhdf5 | 2.52.1 | ✅ passed passed | 2025-09-03 18:16:32 UTC | 2025-09-03 18:16:32 UTC | None | None |
| rhdf5filters | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:11 UTC | 2025-09-03 18:17:11 UTC | None | None |
| Rhdf5lib | 1.30.0 | ✅ passed passed | 2025-09-03 18:17:40 UTC | 2025-09-03 18:17:40 UTC | None | None |
| Rhtslib | 3.4.0 | ✅ passed passed | 2025-09-03 18:18:26 UTC | 2025-09-03 18:18:26 UTC | None | None |
| RProtoBufLib | 2.20.0 | ✅ passed passed | 2025-09-03 18:17:42 UTC | 2025-09-03 18:17:42 UTC | None | None |
| Rsamtools | 2.24.1 | ✅ passed passed | 2025-09-03 18:15:27 UTC | 2025-09-03 18:15:27 UTC | None | None |
| rtracklayer | 1.68.0 | ✅ passed passed | 2025-09-03 18:19:30 UTC | 2025-09-03 18:19:30 UTC | None | None |
| S4Arrays | 1.8.1 | ✅ passed passed | 2025-09-03 18:16:34 UTC | 2025-09-03 18:16:34 UTC | None | None |
| S4Vectors | 0.46.0 | ✅ passed passed | 2025-09-03 18:18:31 UTC | 2025-09-03 18:18:31 UTC | None | None |
| seqLogo | 1.74.0 | ✅ passed passed | 2025-09-03 18:19:31 UTC | 2025-09-03 18:19:31 UTC | None | None |
| ShortRead | 1.66.0 | ✅ passed passed | 2025-09-03 18:19:27 UTC | 2025-09-03 18:19:27 UTC | None | None |
| siggenes | 1.82.0 | ✅ passed passed | 2025-09-03 18:20:37 UTC | 2025-09-03 18:20:37 UTC | None | None |
| SingleCellExperiment | 1.30.1 | ✅ passed passed | 2025-09-03 18:16:51 UTC | 2025-09-03 18:16:51 UTC | None | None |
| sketchR | 1.4.0 | ✅ passed passed | 2025-09-03 18:16:56 UTC | 2025-09-03 18:16:56 UTC | None | None |
| SparseArray | 1.8.1 | ✅ passed passed | 2025-09-03 18:16:13 UTC | 2025-09-03 18:16:13 UTC | None | None |
| sparseMatrixStats | 1.20.0 | ✅ passed passed | 2025-09-03 18:17:09 UTC | 2025-09-03 18:17:09 UTC | None | None |
| SRAdb | 1.70.0 | ✅ passed passed | 2025-09-03 18:19:04 UTC | 2025-09-03 18:19:04 UTC | None | None |
| SummarizedExperiment | 1.38.1 | ✅ passed passed | 2025-09-03 18:16:51 UTC | 2025-09-03 18:16:51 UTC | None | None |
| TFBSTools | 1.46.0 | ✅ passed passed | 2025-09-03 18:18:35 UTC | 2025-09-03 18:18:35 UTC | None | None |
| treeclimbR | 1.4.0 | ✅ passed passed | 2025-09-03 18:16:55 UTC | 2025-09-03 18:16:55 UTC | None | None |
| treeio | 1.32.0 | ✅ passed passed | 2025-09-03 18:17:43 UTC | 2025-09-03 18:17:43 UTC | None | None |
| TreeSummarizedExperiment | 2.16.1 | ✅ passed passed | 2025-09-03 18:16:42 UTC | 2025-09-03 18:16:42 UTC | None | None |
| tximeta | 1.26.1 | ✅ passed passed | 2025-09-03 18:16:39 UTC | 2025-09-03 18:16:39 UTC | None | None |
| tximport | 1.36.1 | ✅ passed passed | 2025-09-03 18:16:17 UTC | 2025-09-03 18:16:17 UTC | None | None |
| UCSC.utils | 1.4.0 | ✅ passed passed | 2025-09-03 18:16:54 UTC | 2025-09-03 18:16:54 UTC | None | None |
| VariantAnnotation | 1.54.1 | ✅ passed passed | 2025-09-03 18:16:41 UTC | 2025-09-03 18:16:41 UTC | None | None |
| vsn | 3.76.0 | ✅ passed passed | 2025-09-03 18:20:47 UTC | 2025-09-03 18:20:47 UTC | None | None |
| XVector | 0.48.0 | ✅ passed passed | 2025-09-03 18:18:36 UTC | 2025-09-03 18:18:36 UTC | None | None |

## Action Items

### High Priority
1. **Fix 11 failed packages** - These are blocking issues that need attention
   - **1 packages** with version number issues

---

*Generated by Bioconductor Gatekeeper System*  
*Report generated: 2025-09-03 18:37:03 UTC*  
*For detailed logs, check the `logs/` directory*

