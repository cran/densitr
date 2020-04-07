## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(densitr)
dp <- dpload(dp.file = system.file("extdata", "00010001.dpa", package = "densitr"))
dp.trimmed <- dptrim(dp)
dp.detrended  <- dpdetrend(dp.trimmed, type = "gam")

## -----------------------------------------------------------------------------
rings <- dprings(dp.detrended)
head(rings)

## ---- fig.width=15, fig.height=10---------------------------------------------
dprings(dp.detrended, return.plot = TRUE)

## ---- fig.width=15, fig.height=10---------------------------------------------
dprings(dp.detrended, smooth = TRUE, return.plot = TRUE)

## -----------------------------------------------------------------------------
get_RW(rings)
dp$footer$xUnit
length(get_RW(rings))

## -----------------------------------------------------------------------------
rw <- get_RW(rings)
## convert to milimetres
rw <- rw / 100
summary(rw)


