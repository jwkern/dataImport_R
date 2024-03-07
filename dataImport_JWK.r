#This R script imports data and model arrays from .csv files, plots them using ggplot2, and 
#then calculates the reduced chi-squared value. 
#
#Written by Joshua W. Kern
#Date: 12/28/23

#library(ggplot2)
#library(ramify)
#library(gridExtra)



########################## Load Data #####################################################
file <- '/home/jwkern/Research/Exopl/Processed_Data/IRTF/ishell/2019/02feb/gvtau_spec.csv'
dataFrame <- read.csv(file)

file2 <- '/home/jwkern/Research/Exopl/Processed_Data/IRTF/ishell/2019/02feb/gvtau_model.csv'
modelFrame <- read.csv(file2)


######################### Remove infinite values #########################################
dataFrame[sapply(dataFrame[,2],is.infinite),2] <- 0
modelFrame[sapply(modelFrame[,2],is.infinite),2] <- 0
dataFrame[sapply(dataFrame[,2],is.na),2] <- 0
modelFrame[sapply(modelFrame[,2],is.na),2] <- 0


######################### Initialize data frames #########################################
dataRange <- c(1:size(dataFrame[1])[1])
modelFrame_corSize <- data.frame(dataRange,dataRange)
colnames(modelFrame_corSize) <- colnames(dataFrame)

######################### Un-interpolate the model to fit the data #######################
#time sink
for (i in dataRange) {
  modelTestFrame <- abs(modelFrame[1]-dataFrame[i,1])
  modelFrame_corSize[i,1] <- modelFrame[which(modelTestFrame == min(modelTestFrame)),1]
  modelFrame_corSize[i,2] <- modelFrame[which(modelTestFrame == min(modelTestFrame)),2]
}


######################## Manually calculate reduced chi-squared value ####################
diff <- modelFrame_corSize[,2]-dataFrame[,2]
redChisq <- sum((diff^2)/(sd(diff)^2))/length(diff)
redChisq[1] <- round(redChisq[1],2)

######################### Plot the data ##################################################
p1 <- ggplot2::ggplot() + 
  geom_line(data = dataFrame, 
            aes(x = Freq, y = normFlux)
  ) + 
  geom_line(data = modelFrame_corSize, 
            aes(x = Freq, y = normFlux), 
            color = 'blue'
  ) + 
  annotate("text",label = c(expression(chi^2), paste("                 = ",as.character(redChisq[1]))), x = 2025.5,y = 1.205,color = 'blue'
  ) +
  xlim(2025,2040) + 
  ylim(0.4,1.25) + 
  xlab(bquote("Wavenumber" (cm^-1))) + 
  ylab("Normalized Flux") 

grid.arrange(p1, nrow = 1)

