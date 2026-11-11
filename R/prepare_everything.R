library(data.table)
library(ggplot2)
theme_set(theme_classic())
library(reshape2)

##### Functions

import_depmap <- function(file, ID_col = 1, impute = F, verbose = T) {
  .x <- as.list(data.table::fread(file))

  if (is.numeric(ID_col)) {
    ID_col <- names(.x)[[ID_col]]
  }

  ID_col <- .x[ID_col]

  value_cols <- .x[grep(" \\(", names(.x), value = T)]
  dropped_cols <- setdiff(names(.x), c(names(ID_col), names(value_cols)))

  names(value_cols) <- stringr::str_split_i(names(value_cols), " \\(", 1)

  if (verbose & length(dropped_cols) > 0) {
    message(paste0("Dropping columns: ", paste0(dropped_cols, collapse = ", ")))
  }
  .x <- data.frame(value_cols)
  .x <- as.matrix(.x)

  rownames(.x) <- ID_col[[1]]

  return(.x)
}


##### Import data

models <- fread(
  input = file.path("input_data", "Model.csv"),
  select = c(
    "ModelID",
    "OncotreeLineage",
    "OncotreePrimaryDisease",
    "GrowthPattern",
    "ModelType",
    "PatientTreatmentStatus",
    "PatientRace",
    "PrimaryOrMetastasis",
    "Age",
    "Sex"
  )
)
models <- models[OncotreeLineage != ""]

print("Metadata imported!")

chronos <- import_depmap(
  file = file.path("input_data", "CRISPRGeneEffect.csv")
)

print("Chronos scores imported!")

expression <- import_depmap(
  file = file.path(
    "input_data",
    "OmicsExpressionTPMLogp1HumanProteinCodingGenes.csv"
  ),
  ID_col = "ModelID"
)

print("Expression data imported!")

mut <- fread(input = file.path("input_data", "OmicsSomaticMutations.csv"))
mut <- mut[
  ModelID %in% rownames(chronos) & IsDefaultEntryForModel == "Yes",
  .N,
  by = .(HugoSymbol, ModelID, LikelyLoF)
]

print("Mutation data imported!")

oncogenes <- c(
  "TP53",
  "KRAS",
  "BRAF",
  "APC",
  "PTEN",
  "PIK3CA",
  "EGFR",
  "RB1",
  "CDKN2A",
  "SMARCA4"
)


chr_y_genes <- c("DDX3Y", "EIF1AY", "KDM5D", "RPS4Y1", "UTY", "ZFY")
