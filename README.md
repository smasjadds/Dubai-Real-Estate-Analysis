# Dubai-Real-Estate-Analysis

Project Overview
This project presents an end-to-end analysis of Dubai’s real estate market using property-level data. The objective is to uncover pricing patterns, location-based trends, and the impact of amenities on property valuation through an interactive Power BI dashboard.
The workflow replicates a real-world data analytics process: data cleaning (Excel) → analysis (SQL) → visualization (Power BI).

 Business Problem
Real estate investors and buyers often struggle to:
Identify high-value neighborhoods
Understand price drivers (size, bedrooms, amenities)
Evaluate luxury vs standard property pricing
This dashboard provides data-driven insights to support better decision-making.

Tech Stack
Excel → Data Cleaning & Transformation
SQL → Data Exploration & Aggregations
Power BI → Dashboard & Visualization

Dataset
Source: Kaggle – Dubai Properties Dataset
Records: ~1.9K property listings
Features include:
Price, Size (sqft), Price per sqft
Bedrooms & Bathrooms
Neighborhood
Amenities (Balcony, Pool, Gym, Parking, etc.)

Data Preparation
Converted Boolean values (True/False → 1/0)
Handled missing and inconsistent values
Standardized numerical columns for analysis
Ensured correct data types for aggregation

Dashboard Overview

Key KPIs
Total Listings: 1.91K
Avg Property Price: 2.09M AED
Avg Price per Sqft: 1.33K AED
Most Common Bedroom Type: 2 BHK
Private Pool Availability: 4.3%

Key Insights

📍 1. Location Drives Property Value
Palm Jumeirah (4.4M AED) and Jumeirah (4.2M AED) are the most expensive neighborhoods
Premium coastal areas dominate the high-value market
Central locations like Downtown Dubai also maintain strong pricing
Insight: Location is the strongest factor influencing property prices in Dubai.

2. Price Increases with Bedrooms (Non-Linear Growth)
0–2 bedrooms → gradual price increase
3 bedrooms → moderate jump (~3.3M AED)
4 bedrooms → sharp spike (~10.6M AED)
Insight: Luxury segment begins from 4-bedroom properties, showing exponential price growth.

3. Amenities Significantly Impact Pricing
Properties with balcony consistently show higher average prices
Covered parking is a strong value contributor across all neighborhoods
Properties without key amenities show noticeably lower pricing
Insight: Amenities are not optional in Dubai—they directly influence property valuation.

4. Luxury Features are Rare but High-Value
Only 4.3% properties have private pools
These properties are concentrated in premium neighborhoods
Insight: Luxury features are scarce but significantly increase property value.
📊 5. Market SegmentationHigh-end properties (4–5 bedrooms) form a smaller but highly valuable segment
👉 Insight: Dubai market is volume-driven by mid-range properties, but value-driven by luxury properties.
