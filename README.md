# Data science with R

This repository contains introductory R course materials for molecular and
biomedical science students. The course uses real Cancer Dependency Map
(DepMap) cell-line data to introduce reproducible data analysis in R.

## What the course teaches

The materials introduce R and RStudio, importing and inspecting data, and
working with tables using `data.table`. Students learn to filter, summarise,
and combine data, handle missing values, and create figures with `ggplot2`.

Biological examples use DepMap model metadata, gene-expression measurements,
somatic mutations, and CRISPR gene-effect (Chronos) scores. The modules cover
sex-chromosome biology, gene dependency, and genetic buffering, while
emphasising cautious biological interpretation.

## Required files

Keep the following files and folders in their current relative locations:

| Path | Purpose |
| --- | --- |
| `input_data/Model.csv` | DepMap cell-line metadata. |
| `input_data/CRISPRGeneEffect.csv` | CRISPR gene-effect (Chronos) scores. |
| `input_data/OmicsExpressionTPMLogp1HumanProteinCodingGenes.csv` | Log-transformed protein-coding gene-expression data. |
| `input_data/OmicsSomaticMutations.csv` | Somatic mutation annotations. |
| `R/prepare_everything.R` | Script used to import and prepare course data. |
| `R_introduction.qmd` | Introduction to R, `data.table`, and `ggplot2`. |
| `module_1.qmd` to `module_4.qmd` | Course modules and exercises. |
| `solutions/` | Instructor solution versions of selected modules. |

The HTML files and matching `*_files/` folders are rendered versions of the
Quarto documents and their supporting assets. Keep each HTML file together
with its matching folder when sharing rendered lessons.

## Getting started

Install R and RStudio, then follow `course_preparation.qmd` to install the
required R packages and download the DepMap input data. Open a `.qmd` file in
RStudio to work through or render a lesson. The repository is organised so
that the preparation script and lessons find the input files through the
relative paths listed above.
