#will clear all objects includes hidden objects.
rm(list = ls(all.names = TRUE)) 
# library to read matlab data formats into R
if(!require('R.matlab')) {
  install.packages('R.matlab')
  library('R.matlab')
}
if(!require('stats')) {
  install.packages('stats')
  library('stats')
}

# read in our data
cross_dsads <- readMat(".//HUM3HB.mat")

T <- cross_dsads$T[1]

tm = (length(cross_dsads$hb)-1)*T

lags = seq(0, (2*tm), by= T)

v = cross_dsads$hb[1:1250]

r = Conj(v)

acr = convolve(v,r, type = "open");

plot(lags,acr, type = "l", main = "ACR vs Lags")