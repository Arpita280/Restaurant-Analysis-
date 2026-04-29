# Restaurant-Analysis-
Restaurant Recommendation Analysis using MySQL and Power Bi


## Project Overview

This project analyzes restaurant data to identify high-performing restaurants and build a data-driven recommendation model based on customer behavior, pricing, and service patterns.

## Objective

To determine key factors influencing restaurant success and recommend an ideal restaurant profile using:

* Ratings
* Cost for Two
* Online Delivery
* Cuisine Variety

## Tools & Technologies

* Excel & Power Query → Data Cleaning
* SQL → Exploratory Data Analysis (EDA)
* Power BI → Dashboard & Visualization

## Data Processing

* Removed inconsistencies in city names (e.g., Istanbul, Brasilia)
* Handled missing values (minimal impact)
* Cleaned and standardized text fields
* Converted cost into INR
* Normalized cuisine data using unpivoting

## Dashboard Preview

### Dashboard 1 - Overview

![Overview](images/Dashboard 1 - Overview.png)

### Dashboard 2 - Customer Behaviour

![Customer Behaviour](images/Dashboard 2 - Customer Behaviour.png)

### Dashboard 3 - Pricing Analysis

![Pricing Analysis](images/Dashboard 3 - Pricing Analysis.png)

### Dashboard 4 - Final Recommendation

![Final Recommendation](images/Dashboard 4 - Final Recommendation.png)

## Key Insights

* Dataset is heavily skewed toward India (~90% of total restaurants)
* Most restaurants fall in mid-rating range (2.5 – 3.5)
* Restaurants offering online delivery receive higher customer engagement
* Moderate pricing leads to better customer satisfaction
* Restaurants serving **3–6 cuisines achieve optimal ratings**

## Factors Affecting Ratings

* **Cuisine Variety** → Best performance at 3–6 cuisines
* **Cost** → Affordable restaurants tend to perform better
* **Online Delivery** → Strong impact on engagement (votes)
* **Customer Votes** → Indicator of popularity and trust
* **Table Booking** → Limited impact

## Ideal Restaurant Profile

> High Rating + High Votes + Online Delivery + 3–6 Cuisines + Moderate Cost

## Business Recommendations

* Promote high-rated, delivery-enabled restaurants
* Encourage adoption of online delivery services
* Focus on affordable, high-quality restaurants
* Expand in cities with low restaurant presence

## Project Structure

data/
   raw/
   processed/

dashboard/
sql/
images/
reports/
README.md

## Detailed Report

For complete analysis and SQL queries:

[Download Report](reports/restaurant_analysis_report.pdf)

## Conclusion

Restaurant success is primarily driven by affordability, optimal cuisine variety, and service accessibility rather than premium pricing. These insights can help build an effective recommendation system and improve customer experience.
