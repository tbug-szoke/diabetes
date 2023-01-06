# CWRU Final Project - Diabetes Health Indicator

# Team Members 

- Alexa Hoynacke 
- Theresa Szoke
 
# Segment 1 

## Presentation 

### Selected topic:

For our CWRU Data Analytics Bootcamp Project our group has chosen to analyze diabetes health indicators to help predict a patient’s risk level for diabetes. We will also be further analyzing if there is a correlation between state weather and diabetes risk level. 

### Reason for the selected topic:

We choose this topic because it is interesting and relevant. Diabetes is among the most prevalent chronic diseases in the United States, impacting millions of Americans each year and exerting a significant financial burden on the economy. Most people today, either personally struggle with Diabetes or know someone who does. Diabetes is a serious chronic disease in which individuals lose the ability to effectively regulate levels of glucose in the blood, and can lead to reduced quality of life and life expectancy. Early diagnosis can lead to lifestyle changes and more effective treatment, making predictive models for diabetes risk important tools for public and public health officials.

### Description of data source:

We will also be utilizing datasets from Behavioral Risk Factor Surveillance System (Kaggle)
https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset

The Behavioral Risk Factor Surveillance System (BRFSS) is the nation's premier system of health-related telephone surveys that collect state data about U.S. residents regarding their health-related risk behaviors, chronic health conditions, and use of preventive services. 

This dataset is broken into 5 files of public health surveys of 400k people from 2011-2015. We will be utilizing 2011 and 2015 data 

### Questions they hope to answer with the data

- Can survey questions from the BRFSS provide accurate predictions of whether an individual has diabetes?
- What risk factors are most predictive of diabetes risk?
- Can we use a subset of the risk factors to accurately predict whether an individual has diabetes?
- Can we create a short form of questions using feature selection to accurately predict if someone might have diabetes or is at high risk of diabetes?
- Are there other correlations between state level factors and diabetes risk indicators? 

## GitHub

### Communication Protocols

- GitHub 
- Slack
- email
- Class sessions 

## Machine Learning Model

### Provisional Machine Learning Model 
- Takes in data in from the provisional database
- Outputs label(s) for input data

#### EDA and Machine Learning Models 

For our final project we are looking at 57 different factors that could potenitally help predict if a person has diabetes. We completed exploratory data anlysis, feature importance analysis, and assessed 3 different Machine Learning Models (Random Forest Classifier, Decision Tree, and Support Vector Machine)

Below is a screenshot outlining our feature importance analysis. Through this test we were able to identify which features have the largest impact on predicting if a person has diabetes. Following this analysis we are now focsing on 20 features versus the intial 57. 

<img width="544" alt="Screenshot 2023-01-05 at 8 26 30 PM" src="https://user-images.githubusercontent.com/111096384/210910985-5d0fff75-c9e9-470c-8d35-3475bd5a9506.png">

We also found that the Random Forest Classifier Machine Learning Model is the best model to accurately predict if a person has diabetes based off the BRFSS dataset features 

See the below screenshots:

<img width="538" alt="Screenshot 2023-01-05 at 8 34 54 PM" src="https://user-images.githubusercontent.com/111096384/210911902-c5c9d93e-3037-4ab6-9fa4-c27e4bc0372d.png">

<img width="539" alt="Screenshot 2023-01-05 at 8 34 58 PM" src="https://user-images.githubusercontent.com/111096384/210911938-050050e5-842e-4a44-b392-099bb3d7919b.png">

## Database

### Provisional database  
- Sample data that mimics the expected final database structure or schema
- Draft machine learning module is connected to the provisional database

#### Schema 
Below is a screenshot of the schema. 2011 and 2015 Diabetes Database was created in PG admin and the following tables were created: Diabetes (2015 & 2011) and State.

<img width="316" alt="Screenshot 2023-01-05 at 8 37 48 PM" src="https://user-images.githubusercontent.com/111096384/210912191-deca71a1-3162-421c-ae94-3e5d3d8480a5.png">
<img width="318" alt="Screenshot 2023-01-05 at 8 37 53 PM" src="https://user-images.githubusercontent.com/111096384/210912356-58439cd1-5b45-4108-8157-2a89adc6415d.png">
