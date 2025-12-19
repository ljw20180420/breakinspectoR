library(parallel)
library(GenomeInfoDb)
library(Biostrings)
library(GenomicRanges)
library(tidyverse)

source("R/breakinspector.R")

target <- system.file("extdata/vegfa.chr6.bed.gz", package = "breakinspectoR")
nontarget <- system.file(
  "extdata/nontarget.chr6.bed.gz",
  package = "breakinspectoR"
)

offtargets <- breakinspectoR(
  target = target,
  nontarget = nontarget,
  guide = guide,
  PAM = PAM,
  bsgenome = bsgenome,
  cutsiteFromPAM = 3,
  verbose = FALSE
)

offtargets.scission_profile <- scission_profile_analysis(
  x = offtargets,
  target = target,
  nontarget = nontarget,
  bsgenome = "BSgenome.Hsapiens.UCSC.hg38"
)
