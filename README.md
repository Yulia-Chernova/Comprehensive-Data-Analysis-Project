# Comprehensive-Data-Analysis-Project
Comprehensive data analysis project: ETL, SQL, and R processing with interactive Power BI dashboards.
# Comprehensive Data Analysis Project: Fitbit Fitness Tracker 🏃‍♀️📊

## 🎯 Project Overview
The objective of this project is to analyze physical activity and sleep patterns among Fitbit users by combining several analytical tools: **SQL (BigQuery)**, **R (tidyverse)**, **Power BI**, and **Excel (Power Query)**. The project identifies behavioral trends, activity peaks, and the relationship between physical exertion and sleep quality.

## 📊 Dataset Overview
[cite_start]This analysis utilizes the **FitBit Fitness Tracker Data** (authored by Möbius)[cite: 1]. 
* [cite_start]**Integrated Dataset:** 622 observations across 13 variables[cite: 40].
* [cite_start]**Participants:** The analysis covers 24 unique users over 55 distinct dates.
* **Key Statistics (from R Analysis):**
    * [cite_start]**Average Daily Steps:** 8,522 steps[cite: 93].
    * [cite_start]**Median Steps:** 8,776 steps[cite: 85].
    * [cite_start]**Average Calorie Expenditure:** 2,228 kcal/day[cite: 94].
    * [cite_start]**Average Sleep Duration:** 397 minutes (~6.6 hours)[cite: 87].
    * [cite_start]**Average Sleep Efficiency:** 91.2%[cite: 97].

---

## 🛠 Tools & Workflow

### **SQL (BigQuery)**
* [cite_start]Conducted data cleaning and normalization of date formats (US to standard)[cite: 1].
* Joined daily activity logs with cleaned sleep data to produce a unified dataset for analysis.

### **Excel (Power Query)**
* Applied preliminary data transformations and type corrections.
* Utilized Power Query to ensure workflow reproducibility and flexible data handling.

### **R (Tidyverse & Reshape2)**
* [cite_start]Performed deep statistical analysis and calculated descriptive statistics[cite: 12, 247].
* [cite_start]Generated correlation matrices and exploratory plots to validate data trends[cite: 264].

### **Power BI**
* Built an interactive dashboard reflecting the full granularity of the dataset (35 users).
* Created KPI cards, user segmentation by activity level, and intensity heatmaps.

---

## 🔍 Key Insights

### 1. Activity Trends
* [cite_start]**Weekly Patterns:** Saturdays are the most active days (avg. 9,396 steps), followed by Tuesdays (avg. 8,971 steps). [cite_start]Sundays represent the lowest activity levels (avg. 7,562 steps).
* **Peak Hours:** Hourly intensity typically peaks around 12:00 PM and between 5:00 PM – 7:00 PM.
* [cite_start]**Steps vs. Calories:** A strong positive correlation exists between total steps and calories burned[cite: 126, 135].

### 2. Sleep Analysis
* [cite_start]**Duration vs. Activity:** Users average about 6.6 hours of sleep[cite: 87]. 
* [cite_start]**Efficiency:** Statistical analysis shows a weak negative relationship between very high step counts and sleep efficiency, suggesting that moderate activity may lead to better rest quality than extreme exertion.
* **Segmentation:** The highest sleep efficiency is observed among users categorized in the "Middle Activity" segment.

---

## 📂 Repository Structure
* `/sql/` — Scripts for data cleaning, joining, and preparation.
* [cite_start]`/r/` — R scripts and RMarkdown analysis files[cite: 254].
* `/excel/` — Files containing Power Query transformations.
* `/powerbi/` — Interactive Power BI report (`.pbix`).
* `/docs/` — Screenshots and exported visuals of dashboards and SQL queries.

## 🔄 Reproducibility
* **SQL:** Run scripts located in `/sql/` within a BigQuery environment.
* [cite_start]**R:** Ensure `tidyverse` and `reshape2` packages are installed[cite: 8, 247], then execute `source("r/fitness_activity_analysis.R")`.
* **Power BI:** Open `fitness_activity.pbix` in Power BI Desktop to explore the dashboard.

---

## 👩‍💻 Author
[cite_start]**Yulia Chernova** [cite: 2]
*Data Analyst specializing in SQL, Power BI, Excel (Power Query), and R workflows.*