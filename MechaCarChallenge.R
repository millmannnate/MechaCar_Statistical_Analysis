library(dplyr)
#MPG Analyis
mecha_car <- read.csv("MechaCar_mpg.csv")
car_df <- data.frame(mecha_car)
reg <- lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = car_df)
reg
summary(reg)

#Suspension Summary
suspension_data <- read.csv("Suspension_Coil.csv")
total_summary <- summarize(suspension_data, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))

#Lot Summary
lot_group <- group_by(suspension_data, Manufacturing_Lot)
lot_summary <- summarize(lot_group, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))

#T-Test
t.test(suspension_data$PSI,mu=1500)
population1 <- subset(suspension_data, Manufacturing_Lot == "Lot1")
population2 <- subset(suspension_data, Manufacturing_Lot == "Lot2")
population3 <- subset(suspension_data, Manufacturing_Lot == "Lot3")
t.test(population1$PSI,mu=1500)
t.test(population2$PSI,mu=1500)
t.test(population3$PSI,mu=1500)

