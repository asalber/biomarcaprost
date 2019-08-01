# Autor: Alfredo Sánchez Alberca (asalber@ceu.es)
# Biomarcaprost
# Data preprocessing

# Load packages
.packages <- c("tidyverse", "pander")
.installed <- .packages %in% installed.packages()
if (length(.packages[!.installed])>0) install.packages(.packages[!.installed])
lapply(.packages, require, character.only=T)

# Pander options
#panderOptions('table.alignment.default', function(df) ifelse(sapply(as.data.frame(df), is.numeric), 'right', 'left'))
panderOptions('table.alignment.rownames', "left")
panderOptions('keep.line.breaks', TRUE)

# Data loading
data <- read.csv(file="data/psa-data.csv", header=T, sep=",")

# Select variables
psaVars <- colnames(data)[startsWith(colnames(data),"psa")]
psaVars <- psaVars[c(-13, -14, -16)]
psaPeaks <- psaVars[c(-1, -2, -3)]
data.peaks <- select(data, psaPeaks)
