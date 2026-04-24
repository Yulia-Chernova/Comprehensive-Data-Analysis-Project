# Comprehensive Data Analysis Project: Fitbit Fitness Tracker 

## Project Overview
The objective of this project is to analyze physical activity and sleep patterns among Fitbit users by combining several analytical tools: **SQL (BigQuery)**, **R (tidyverse)**, **Power BI**, and **Excel (Power Query)**. The project identifies behavioral trends, activity peaks, and the relationship between physical exertion and sleep quality.

## Dataset Overview
This analysis utilizes the [FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) (authored by Möbius). 
* **Integrated Dataset:** 622 observations across 13 variables.
* **Participants:** 35 unique users across all tables; 24 users with complete activity + sleep data (used for correlation analysis).
* **Key Statistics (from R Analysis):**
    * **Average Daily Steps:** 8,522 steps.
    * **Median Steps:** 8,776 steps.
    * **Average Calorie Expenditure:** 2,228 kcal/day.
    * **Average Sleep Duration:** 397 minutes (~6.6 hours).
    * **Average Sleep Efficiency:** 91.2%.

![Power BI Dashboard 1](docs/activity_analysis_pbi%20(1).png)
![Power BI Dashboard 2](docs/activity_analysis_pbi%20(2).png)

---

## Tools & Workflow

### **SQL (BigQuery)**
* Conducted data cleaning and normalization of date formats (US to standard).
* Joined daily activity logs with cleaned sleep data to produce a unified dataset for analysis.

### **Excel (Power Query)**
* Applied preliminary data transformations and type corrections.
* Utilized Power Query to ensure workflow reproducibility and flexible data handling.

### **R (Tidyverse & Reshape2)**
* Performed deep statistical analysis and calculated descriptive statistics.
* Generated correlation matrices and exploratory plots to validate data trends.

### **Power BI**
* Built an interactive dashboard reflecting the full granularity of the dataset (35 users).
* Created KPI cards, user segmentation by activity level, and intensity heatmaps.

---

## Key Insights

### 1. Activity Trends
* **Weekly Patterns:** Saturdays are the most active days (avg. 9,396 steps), followed by Tuesdays (avg. 8,971 steps). Sundays represent the lowest activity levels (avg. 7,562 steps).
* **Peak Hours:** Hourly intensity typically peaks around 12:00 PM and between 5:00 PM – 7:00 PM.
* **Steps vs. Calories:** A strong positive correlation exists between total steps and calories burned.

### 2. Sleep Analysis
* **Duration vs. Activity:** Users average about 6.6 hours of sleep. 
* **Efficiency:** Statistical analysis shows a weak negative relationship between very high step counts and sleep efficiency, suggesting that moderate activity may lead to better rest quality than extreme exertion.
* **Segmentation:** The highest sleep efficiency is observed among users categorized in the "Middle Activity" segment.

---

## Repository Structure
* `/data/` — Raw CSV files and Excel file with Power Query transformations.
* `/docs/` — Screenshots and exported visuals of dashboards and SQL queries.
* `/excel/` — Files containing Power Query transformations.
* `/powerbi/` — Interactive Power BI report (`.pbix`).
* `/r/` — R scripts and RMarkdown analysis files.
* `/sql/` — Scripts for data cleaning, joining, and preparation.


## Reproducibility
Raw data available on Kaggle. SQL scripts require a BigQuery environment; R scripts require tidyverse and reshape2.
* **Power BI:** [Download fitness_activity.pbix](powerbi/fitness_activity.pbix) to explore the dashboard in Power BI Desktop.
* **Excel (Power Query):** [Open fitness_activity_dashboard.xlsx](excel/fitness_activity_dashboard.xlsx) to explore Power Query steps.

---

## Author
**Yulia Chernova**
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Yulia%20Chernova-blue?logo=linkedin)](https://www.linkedin.com/in/ychernova/)
*Data Analyst specializing in SQL, Power BI, Excel (Power Query), and R workflows.*
