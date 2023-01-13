# CWRU Final Project - Diabetes Trends, Predictions and Proposals

### Team Members 

- Alexa Hoynacke 
- Theresa Szoke
 
### Communication Protocols

- GitHub 
- Slack
- email
- Class sessions 

# Overview 

For our capstone project, we will be analyzing data from the CDC's annual behavioral health risk surveillance survey (BRFSS) to gain a deeper understanding of the prevalence of diabetes and to determine if other health risk factors can be reliably and accurately utilized to predict diabetes risk.

In 2019, diabetes was the 7th leading cause of death in the United States.  37.3 million people in the United States are afflicted with diabetes, including 8.5 million who are undiagnosed.  These statistics alone make this a worthy topic of study.  In addition, the availability of rich data sets from the CDC's survey made this a compelling project topic.

## Questions we hope to answer:
1. Can we create a machine learning model capable of predicting a person’s likelihood of having diabetes on the basis of answers to health risk questions?  
    - Is that model consistent with the risk factors that the CDC and others use to assess risk?
2. Will that model perform equally well on data from 2011 as 2015?  Does it perform equally well for men or women?  Any difference by race?
3. What are the top 10-20 factors, available in the survey, which correlate to diabetes risk?
    - How simple can we make the inputs to achieve an accuracy score over 80%?
4. Do different states have different levels of diabetes prevalence?  If so, does that correlate to any other state specific factors? (weather, socio economic levels, public infrastructure or attitudes) (NOTE that we do not have data set for these questions yet)

## Data sources:

We are utilizing data from the 2011 and 2015 BRFSS surveys from a [Kaggle](https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system) source.  This data was converted from SAS format to CSV, which was easy for us to utilize in our project.


The Behavioral Risk Factor Surveillance System (BRFSS) is the nation's premier system of health-related telephone surveys that collect state data about U.S. residents regarding their health-related risk behaviors, chronic health conditions, and use of preventive services. 

# Analysis

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

# Results

Our draft presentation is availabe on [google documents](https://docs.google.com/presentation/d/1dauYWDsVA_TuFciaeeTqlzg6qKlfKbXqYvTsndvt5L0/edit?usp=sharing).

We will be developing our Tableau dashboard (referenced in the draft presentation) in the coming weeks.







