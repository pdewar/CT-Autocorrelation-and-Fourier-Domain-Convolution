# library to read matlab data formats into R
library(R.matlab)

# read in our data
cross_dsads <- readMat("C:/Users/mine/Desktop/R//HUM3HB.mat")

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

j

#w = -Fs[1]/2

#w

#w2 = Fs[1]/length(a)

#w2

#w3 = (Fs[1]/2)-(Fs[1]/length(a))

#w3

freq = seq(from=-250, by=0.2, to=249.8)

plot(freq, power, type = "l", main = "Power vs Frequency")
