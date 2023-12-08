library(ggplot2) 
library(MASS)
data(Cars93) 
cars93 <- MASS::Cars93 
ggplot(cars93, aes(x = Price, y
                   =Fuel.tank.capacity))+ 
  geom_point(color = "grey60") + 
  geom_smooth(se = FALSE, method = "loess",formula = y ~ x, color = "#0072B2") 
+ scale_x_continuous( 
  name = "price (USD)", 
  breaks = c(20, 40, 60), 
  labels = c("$20,000", "$40,000", "$60,000") 
) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

#Linear Model (lm)
figure_lm <- ggplot(Cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(method = "lm", se = TRUE, color = "#8fe388") +
  labs(x = "Price (USD)", y = "Fuel Tank Capacity (US gallons)") +
  ggtitle("Linear Model") +
  theme(plot.title = element_text(size = 14, color = "#8fe388"))

print(figure_lm) 

#Generalized Linear Model (glm) 
figure_glm <- ggplot(Cars93, aes(x = Price, y = Fuel.tank.capacity)) + 
  geom_point(color = "grey60") +
  geom_smooth(method = "glm", se = TRUE, color = "#fe8d6d") +
  labs(x = "Price (USD)", y = "Fuel Tank Capacity (US gallons)") +
  ggtitle("Generalized Linear Model") + 
  theme(plot.title = element_text(size = 14, color = "#fe8d6d")) 

print(figure_lm) 

#Generalized Linear Model (glm) 
figure_glm <- ggplot(Cars93, aes(x = Price, y = Fuel.tank.capacity)) + 
  geom_point(color = "grey60") +
  geom_smooth(method = "glm", se = TRUE, color = "#fe8d6d") +
  labs(x = "Price (USD)", y = "Fuel Tank Capacity (US gallons)") +
  ggtitle("Generalized Linear Model") + 
  theme(plot.title = element_text(size = 14, color = "#fe8d6d")) 

print(figure_glm)

#Generalized Additive Model (glm) 
figure_gam <- ggplot(Cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_smooth(method = "gam", se = TRUE, color = "#7c6bea") +
  labs(x = "Price (USD)", y = "Fuel Tank Capacity (US gallons)") + 
  ggtitle("Generalized Additive Model") +
  theme(plot.title = element_text(size = 14, color = "#fe8d6d")) 

print(figure_glm)

#Generalized Additive Model (gam) 
figure_gam <- ggplot(Cars93, aes(x = Price, y = Fuel.tank.capacity)) + 
  geom_point(color = "grey60")+
  geom_smooth(method = "gam", se = TRUE, color = "#7c6bea") +
  labs(x = "Price (USD)", y = "Fuel Tank Capacity (US gallons)") + 
  ggtitle("Generalized Additive Model") +
  theme(plot.title = element_text(size = 14, color = "#7c6bea"))

print(figure_gam)

