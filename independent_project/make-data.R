set.seed(357)
dat <- data.frame(country = rep(c("Mozambique", "Uganda", "Burkina_Faso", "Cameroon", "Guinea-Bissau"), c(35, 55, 60, 70, 25)),
                  country.code = rep(c("MZ", "UG", "BF", "CM", "GB"), c(35, 55, 60, 70, 25)),
                  Plasmodium = c(rnorm(35, 4000, 500), rnorm(55, 1500, 400), rnorm(60, 1000, 200), rnorm(70, 100, 100), rnorm(25, 500, 50)),
                  Pseudomonas = c(rnorm(35, 1100, 330), rnorm(55, 400, 240), rnorm(60, 600, 460), rnorm(70, 1100, 200), rnorm(25, 1100, 330)),
                  Enterobacter = c(rnorm(35, 900, 450), rnorm(55, 450, 150), rnorm(60, 550, 320), rnorm(70, 850, 150), rnorm(25, 30, 60)),
                  Staphylococcus = c(rnorm(35, 450, 130), rnorm(55, 400, 200), rnorm(60, 100, 450), rnorm(70, 350, 150), rnorm(25, 810, 430)),
                  Asaia = c(rnorm(35, 500, 30), rnorm(55, 450, 90), rnorm(60, 10, 30), rnorm(70, 350, 240), rnorm(25, 660, 300)))
dat[dat < 0] <- 0 # change any negative values to 0 because you can't have a negative abundance
  # going to give error: ‘<’ not meaningful for factors‘<’ not meaningful for factors
  # but it doesn't matter, it is just saying it is not replacing anything in the columns that are not numeric
dat[3:7] <- round(dat[3:7], 0) # round the data to whole numbers
dat$id.code <- sprintf(paste(dat$country.code, "_%3d", sep = ""), seq(1:nrow(dat))) # make a column with a unique ID for each individual

write.csv(dat, "~/Desktop/microbiome_example.csv", row.names = F) # output a .csv file
