library(parallel)
library(GenomeInfoDb)

source("R/breakinspector.R")

target_file <- system.file(
  "extdata/vegfa.chr6.bed.gz",
  package = "breakinspectoR"
)
non_target_file <- system.file(
  "extdata/nontarget.chr6.bed.gz",
  package = "breakinspectoR"
)
guide <- "GACCCCCTCCACCCCGCCTC"
PAM <- c(canonical = "NGG", "NAG")
bsgenome <- "BSgenome.Hsapiens.UCSC.hg38"


offtargets <- breakinspectoR(
  target = target_file,
  nontarget = non_target_file,
  guide = guide,
  PAM = PAM,
  bsgenome = bsgenome,
  cutsiteFromPAM = 3,
  verbose = FALSE
)
