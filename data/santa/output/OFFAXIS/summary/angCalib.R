# angCalib -- same as .m

# read data
data <- read.table("orig_fit.dat", TRUE)

# plot data
# par(col="blue")
p <- plot(data$MU, data$DEG, main="SANTA | Rough Angular Calibration", xlab="phi_{Recon}", ylab="phi_True")


