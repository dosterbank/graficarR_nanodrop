
# 
rm(list = ls())
################################ Librerias #####################################
library(ggplot2)

install.packages("statsr")
library(statsr)

####################### carga el archivo por ventana en examinar ###############
#tiene que estar en formato csv

Data <- read.csv(file.choose(), header = T, sep=";")

#se pueden cargar cualquier datos csv

########################## Factoriza los datos ################################@
Data$Time <- as.factor(Data$Time)
Data$Wavelength <- as.factor(Data$Wavelength)
Data$Absorbance <- as.factor(Data$Absorbance)
######################### Profe ################################################

#################################improved boxplot#######################################
Time <- Data$Time
Absorbance <- Data$Absorbance
Wavelength <- Data$Wavelength


# Define the data frame
Data_Fs <- data.frame(
  Time,
  Absorbance,
  Wavelength 
)

# Create the boxplot with separated colors



#########################
  
  ggplot(Data_Fs, aes(x = Wavelength, y = Absorbance, fill = Time)) +
    ggtitle("Nanodrop Fish scales N3 all Wavelengths") +
    geom_boxplot() +
    geom_point(aes(color = Time), size = 3) +
    geom_line(aes(group = Time, color = Time), size = 1)+
    scale_fill_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
    # Add jittered points
    # geom_point(position = position_jitter(height = 0.01), size = 2, shape = 21, stroke = 0.0, aes(color = Time, fill = Time)) +
    # Add vertical lines at Rt boundary
    #geom_vline(xintercept = c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5, 12.5, 13.5, 14.5, 15.5, 16.5), linetype = "dotted", color = "black") +
    # Set color and fill scales
    scale_color_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
    scale_fill_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
    labs(x = "Wavelength [nm]", y = "Absorbance", fill = "Time") +
    theme_classic() +
    theme(axis.text.x = element_text(angle=90, vjust=0.5),
          axis.text.y = element_text(size = 4.8),
          panel.grid.major = element_line(),
          panel.grid.minor = element_line())
###################################################################
rm(list = ls())
Data <- read.csv(file.choose(), header = T, sep=";")
Data1 <- subset(Data, Absorbance >= -0.21 & Absorbance <= 1)
Data2 <- subset(Data1, Wavelength >= 280 & Wavelength <= 700)


Data2$Time <- as.factor(Data2$Time)
Data2$Wavelength <- as.factor(Data2$Wavelength)
Data2$Absorbance <- as.factor(Data2$Absorbance)

Time <- Data2$Time
Absorbance <- Data2$Absorbance
Wavelength <- Data2$Wavelength


# Define the data frame
Data_Fs <- data.frame(
  Time,
  Absorbance,
  Wavelength 
)

ggplot(Data_Fs, aes(x = Wavelength, y = Absorbance, fill = Time)) +
  ggtitle("Nanodrop Fish scales N3 specific Wavelength") +
  geom_boxplot() +
  geom_point(aes(color = Time), size = 3) +
  geom_line(aes(group = Time, color = Time), size = 1)+
  scale_fill_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
  # Add jittered points
  # geom_point(position = position_jitter(height = 0.01), size = 2, shape = 21, stroke = 0.0, aes(color = Time, fill = Time)) +
  # Add vertical lines at Rt boundary
  #geom_vline(xintercept = c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5, 12.5, 13.5, 14.5, 15.5, 16.5), linetype = "dotted", color = "black") +
  # Set color and fill scales
  scale_color_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
  scale_fill_manual(values = c("magenta", "blue", "yellow", "cyan", "green", "gray50", "pink", "purple", "red", "orange")) +
  labs(x = "Wavelength [nm]", y = "Absorbance", fill = "Time") +
  theme_classic() +
  theme(axis.text.x = element_text(angle=90, vjust=0.5),
        axis.text.y = element_text(size = 4.8),
        panel.grid.major = element_line(),
        panel.grid.minor = element_line())
