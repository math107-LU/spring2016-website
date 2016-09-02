## --------------------------------------------------------------
## Bootstrapping in R
## CI for one mean
## Data set: American Community Survey
## --------------------------------------------------------------

# Load the moasic and ggplot2 packages
library(mosaic)
library(ggplot2)

# Load the data
acs <- read.csv("data/ACS.csv")

# Calculate the observed average age
xbar <- mean(~Age, data = acs); xbar

# To get a bootstrap sample, use the resample function
mean(~Age, data = resample(acs))

# Creating a bootstrap distribution of 1000 sample means
age_boot <- do(1000) * mean(~Age, data = resample(acs))

# Plot the bootstrap distribution
ggplot(data = age_boot) + 
  geom_histogram(mapping = aes(x = mean)) + 
  xlab("Means")

# Calculate the standard error
SE <- sd(~mean, data = age_boot); SE

# Calculate a 95% CI

# Lower bound
xbar - 2 * SE

# Upper bound
xbar + 2 * SE
