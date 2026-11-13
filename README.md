# Data science with R

This repository contains introductory R course materials for molecular and
biomedical science students. The course uses real Cancer Dependency Map
(DepMap) cell-line data to introduce reproducible data analysis in R. The
materials are currently under development; three exercise modules are
available, but some exercises and instructor solutions are not yet complete.

## What the course teaches

The materials introduce R and RStudio, importing and inspecting data, and
working with tables using `data.table`. Students learn to filter, summarise,
and combine data, handle missing values, and create figures with `ggplot2`.

Biological examples use DepMap model metadata, gene-expression measurements,
somatic mutations, and CRISPR gene-effect (Chronos) scores. The current modules
cover sex-chromosome biology, gene dependency, mutation status, the TP53-MDM2
relationship, and genetic buffering. More negative Chronos scores generally
indicate a stronger fitness defect following gene knockout; they are not
universal significance thresholds.

## Software requirements

- R and RStudio
- Quarto for rendering the `.qmd` documents
- The R packages `data.table`, `ggplot2`, `reshape2`, and `stringr`

Installation instructions are provided in `course_preparation.qmd`. The raw
DepMap input files occupy approximately 1.5 GB, and importing the full matrices
requires additional memory.

## Required files

Keep the following files and folders in their current relative locations:

| Path | Purpose |
| --- | --- |
| `input_data/Model.csv` | DepMap cell-line metadata. |
| `input_data/CRISPRGeneEffect.csv` | CRISPR gene-effect (Chronos) scores. |
| `input_data/OmicsExpressionTPMLogp1HumanProteinCodingGenes.csv` | Log-transformed protein-coding gene-expression data. |
| `input_data/OmicsSomaticMutations.csv` | Somatic mutation annotations. |
| `R/prepare_everything.R` | Script used to import and prepare course data. |
| `course_preparation.qmd` | Software and data-download instructions. |
| `R_introduction.qmd` | Introduction to R, `data.table`, and `ggplot2`. |
| `module_1.qmd` to `module_3.qmd` | Current course modules and exercises. |
| `module_1_solution.qmd` to `module_3_solution.qmd` | Instructor solution drafts. |

The input filenames must match the names above exactly. In particular, the
CRISPR file is named `CRISPRGeneEffect.csv`.

## Getting started

1. Install R, RStudio, Quarto, and the required R packages.
2. Follow `course_preparation.qmd` to obtain the required DepMap release files.
3. Place the four CSV files in `input_data/` without renaming them.
4. Open the repository as the working directory in RStudio.
5. Start with `R_introduction.qmd`, then work through the numbered modules.

The lessons load `R/prepare_everything.R` themselves. That script imports the
full DepMap files and creates the objects used in the exercises. Do not move
the lesson files or change the relative directory structure unless you also
update these paths.


## Additional resources for learning R

- **R for data science** ([https://r4ds.hadley.nz/](https://r4ds.hadley.nz/))
- Inspiration for scientific data visualizations: **The R graph gallery** ([https://r-graph-gallery.com/](https://r-graph-gallery.com/)) 
- YouTube channel teaching R basics: **R Programming 101** ([https://www.youtube.com/@RProgramming101](https://www.youtube.com/@RProgramming101))
- YouTube channel for learning statistics and machine learning: **StatQuest with Josh Starmer** ([https://www.youtube.com/@statquest](https://www.youtube.com/@statquest))

