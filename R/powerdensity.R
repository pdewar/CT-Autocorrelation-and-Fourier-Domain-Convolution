#will clear all objects includes hidden objects.
rm(list = ls(all.names = TRUE)) 
# library to read matlab data formats into R
if(!require('R.matlab')) {
  install.packages('R.matlab')
  library('R.matlab')
}

# read in our data
cross_dsads <- readMat(".//HUM3HB.mat")

Fs <- 1/(cross_dsads$T)

n = 1250;

t = seq(1,1250, by = 1)

my_vec <- cross_dsads$hb

my_vec <- t(my_vec)
  
hold = matrix(0, n, 1)

g <- rbind(my_vec,hold)

fx = fft(g)

row_vec1 <- c((n+1):length(fx))
row_vec2 <- c(1:n)

fx_row1 <- fx[row_vec1,1]
fx_row2 <- fx[row_vec2,1]

fx_row1 <- t(fx_row1)
fx_row2 <- t(fx_row2)
 
a = cbind(fx_row1, fx_row2)

a = t(a)

power = abs(a*a)

freq = seq(-Fs[1]/2, by=Fs[1]/length(a), to=(Fs[1]/2)-(Fs[1]/length(a)))

plot(freq, power, type = "l", main = "Power vs Frequency")
