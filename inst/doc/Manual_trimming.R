## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(densitr)
dp.list <- dpload(dp.directory = system.file("extdata", package = "densitr"))
dp.trimmed  <- dptriml(dp.list)

## ---- fig.width=15, fig.height=5----------------------------------------------
dptrim(dp.list[["00050045"]], return.plot = TRUE)

## ---- eval = FALSE------------------------------------------------------------
#  manual_trim_detect(dp.list[["00050045"]])

## ---- eval = FALSE------------------------------------------------------------
#  dp.trimmed  <- dptriml(dp.list, rreport = TRUE)
#  dp.new <- correct_failures(dp.trimmed)

## -----------------------------------------------------------------------------
dp.trimmed  <- dptriml(dp.list, rreport = TRUE)
dp.successful <- remove_trim_failures(dp.trimmed)
length(dp.successful)
dp.failed <- separate_trim_failures(dp.trimmed)
length(dp.failed$failures.end)

