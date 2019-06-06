#Create a virtual Galton board
library(tidyverse); library(cowplot)

prob = 0.5 #probability of 'success'
ntrial = 100  #number of trials per ball
i = 0
samp = data.frame(V1 = as.numeric())

while(i == 0) {
	samp <- rbind(samp, data.frame(V1 = rbinom(1, size = ntrial, prob)))
	if(nrow(samp) == 1) next
	fig <- ggplot() +
		geom_histogram(data = samp, aes(x = V1, y = ..density..), color = "black", fill = "gray80", bins = 30) +
		stat_function(data = samp, aes(V1),
			fun = dnorm, n = 100,
			args = list(mean = prob * ntrial, sd = sqrt(ntrial * prob * (1 - prob))),
			color = "red") +
		xlim(c(20, 80)) +
		ylim(c(0, .1)) +
		labs(x = "", 
			y = "Density", 
			title = paste(nrow(samp), "trials", sep = " "), 
			subtitle = "press esc to stop") +
		NULL
	print(fig)
	#Sys.sleep(.2) #optional: will slow down simulation
}
