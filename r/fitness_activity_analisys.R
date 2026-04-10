# ============================================================
# Fitness Tracker Data Analysis
# Author: Yulia Chernova
# Purpose: Activity + Sleep Analysis using tidyverse
# ============================================================

# Load packages ---------------------------------------------------------------
install.packages("tidyverse")
library(tidyverse)
library(reshape2)

# Load data -------------------------------------------------------------------
data <- read_csv("final_analysis_set.csv")

# Convert date column ---------------------------------------------------------
data <- data %>%
  mutate(ActivityDate = as.Date(ActivityDate))

# Summary statistics -----------------------------------------------------------
summary_stats <- data %>%
  summarise(
    Unique_Users = n_distinct(Id),
    Unique_Dates = n_distinct(ActivityDate),
    
    Avg_Steps = mean(TotalSteps, na.rm = TRUE),
    Median_Steps = median(TotalSteps, na.rm = TRUE),
    Max_Steps = max(TotalSteps, na.rm = TRUE),
    
    Avg_Calories = mean(Calories, na.rm = TRUE),
    Median_Calories = median(Calories, na.rm = TRUE),
    Max_Calories = max(Calories, na.rm = TRUE),
    
    Avg_Sleep_Minutes = mean(minutes_asleep, na.rm = TRUE),
    Median_Sleep_Minutes = median(minutes_asleep, na.rm = TRUE),
    Avg_Sleep_Efficiency = mean(sleep_efficiency_pct, na.rm = TRUE)
  )

print(summary_stats, width = Inf)

# Visualization: Distribution of Steps ----------------------------------------
ggplot(data, aes(x = TotalSteps)) +
  geom_histogram(binwidth = 2000, fill = "skyblue", color = "black") +
  geom_vline(aes(xintercept = mean(TotalSteps, na.rm = TRUE)),
             linetype = "dashed", color = "red", linewidth = 1) +
  labs(
    title = "Distribution of Daily Total Steps",
    x = "Total Steps",
    y = "Frequency (Number of Days)",
    caption = paste("Mean Steps:", round(mean(data$TotalSteps), 0))
  ) +
  theme_minimal()

# Visualization: Steps vs Calories --------------------------------------------
ggplot(data, aes(x = TotalSteps, y = Calories)) +
  geom_point(alpha = 0.6, color = "darkblue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Relationship Between Steps and Calories Burned",
    x = "Total Steps",
    y = "Calories Burned"
  ) +
  theme_classic()

# Add weekday column -----------------------------------------------------------
data <- data %>%
  mutate(
    WeekDay = weekdays(ActivityDate),
    WeekDay = factor(
      WeekDay,
      levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
    )
  )

# Visualization: Steps by Weekday ---------------------------------------------
ggplot(data, aes(x = WeekDay, y = TotalSteps, fill = WeekDay)) +
  geom_boxplot() +
  labs(
    title = "Distribution of Total Steps by Day of the Week",
    x = "Day of the Week",
    y = "Total Steps"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Average steps by weekday -----------------------------------------------------
daily_step_average <- data %>%
  group_by(WeekDay) %>%
  summarise(
    Avg_Steps = round(mean(TotalSteps, na.rm = TRUE), 0),
    Median_Steps = round(median(TotalSteps, na.rm = TRUE), 0),
    Total_Observations = n()
  )

print(daily_step_average)

# Sleep analysis ---------------------------------------------------------------
data$hours_asleep <- data$minutes_asleep / 60

# Visualization: Sleep Duration vs Steps --------------------------------------
ggplot(data, aes(x = hours_asleep, y = TotalSteps)) +
  geom_point(color = "steelblue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Relationship Between Sleep Duration and Daily Steps",
    x = "Hours Asleep",
    y = "Total Steps"
  ) +
  theme_minimal()

# Visualization: Sleep Efficiency vs Steps ------------------------------------
ggplot(data, aes(x = TotalSteps, y = sleep_efficiency_pct)) +
  geom_point(color = "darkgreen", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Relationship Between Steps and Sleep Efficiency",
    x = "Total Steps",
    y = "Sleep Efficiency (%)"
  ) +
  theme_minimal()

# Correlation matrix -----------------------------------------------------------
corr_data <- data %>%
  select(
    Steps = TotalSteps,
    Cal = Calories,
    SleepMin = minutes_asleep,
    BedTime = total_time_in_bed,
    Eff = sleep_efficiency_pct
  )

corr_matrix <- cor(corr_data, use = "complete.obs")

ggplot(melt(corr_matrix), aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "red", high = "blue", mid = "white", midpoint = 0) +
  labs(title = "Correlation Matrix: Activity & Sleep Metrics") +
  theme_minimal()
