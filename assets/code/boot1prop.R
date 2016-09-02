## --------------------------------------------------------------
## Bootstrapping in R
## CI for one proportion
## Data set: American Community Survey
## --------------------------------------------------------------

# Load the moasic and ggplot2 packages
library(mosaic)
library(ggplot2)

# Load the data
acs <- read.csv("data/ACS.csv")

# Calculate the observed proportion of native English speakers
phat <- prop(~Language == "english", data = acs); phat

# To get a bootstrap sample, use the resample function
prop(~Language == "english", data = resample(acs))

# Creating a bootstrap distribution of 1000 sample proportions
english_boot <- do(1000) * prop(~Language == "english", data = resample(acs))

# Plot the bootstrap distribution
ggplot(data = english_boot) + 
  geom_histogram(mapping = aes(x = TRUE.)) + 
  xlab("Proportions")

# Calculate the standard error
SE <- sd(english_boot$TRUE.); SE

# Calculate a 95% CI

# Lower bound
phat - 2 * SE

# Upper bound
phat + 2 * SE
