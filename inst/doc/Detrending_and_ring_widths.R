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
plot(dp.list[[1]])

## ---- fig.width=15, fig.height=5----------------------------------------------
plot(dp.trimmed[[1]])

## -----------------------------------------------------------------------------
trend <- stats::lm(amplitude ~ position, data = dp.trimmed[[1]]$data)
fit <- stats::predict(trend, newdata = dp.trimmed[[1]]$data)
detrended.amplitude  <- dp.trimmed[[1]]$data$amplitude - fit + fit[1]

## ---- fig.width=15, fig.height=5----------------------------------------------
plot(y = dp.trimmed[[1]]$data$amplitude,
     x = dp.trimmed[[1]]$data$position,
     type = "l", lty = 1, ylim = c(350,700),
     xlab = "Drilling depth [1/100 mm]",
     ylab = "Resistograph density [rel]")
abline(trend, lty=2, col = "blue")
lines(y = detrended.amplitude, x = dp.trimmed[[1]]$data$position, ylim = c(100, 700), col = "red")

## ---- fig.width=15, fig.height=5----------------------------------------------
dp.detrended  <- dpdetrend(dp.trimmed[[1]], type = "gam")
plot(dp.detrended)

## ---- fig.width=15, fig.height=5----------------------------------------------
plot(y = dp.trimmed[[1]]$data$amplitude,
     x = dp.trimmed[[1]]$data$position,
     type = "l", lty = 1, ylim = c(350,700),
     xlab = "Drilling depth [1/100 mm]",
     ylab = "Resistograph density [rel]")
lines(y = detrended.amplitude, x = dp.trimmed[[1]]$data$position, ylim = c(100, 700), col = "red")
lines(y = dp.detrended$data$amplitude, x = dp.detrended$data$position, ylim = c(100, 700), col = "blue")


## ---- eval = FALSE------------------------------------------------------------
#  library(pbapply)
#  dp.detrended  <- pblapply(dp.trimmed, dpdetrend, type = "linear", cl=3)
#  ## without pbapply library, you could just use:
#  dp.detrended  <- lapply(dp.trimmed, dpdetrend, type = "linear")

