# CWRU Data Analytics Bootcamp Capstone Project - Diabetes Trends, Predictions and Proposals

## Overview 
In this project, we analyzed data from the CDC's annual behavioral health risk surveillance survey (BRFSS) to gain a deeper understanding of the prevalence of diabetes and to determine if a machine learning model can be created to predict the risk of having diabetes or prediabetes based on general health risk factors.

In 2019, diabetes was the 7th leading cause of death in the United States.  37.3 million people in the United States are afflicted with diabetes, including 8.5 million who are undiagnosed.  These statistics alone make this a worthy topic of study.  In addition, the availability of rich data sets from the CDC's survey made this a compelling project topic.

### Questions we set out to answer:
1. Can we create a machine learning model capable of predicting a person’s likelihood of having diabetes on the basis of answers to health risk questions?  
2. What are the top factors, available in the health risk survey, which correlate to diabetes risk?
3. Do different states have different levels of diabetes prevalence?  If so, what state specific factors might be interesting to evaluate in future studies? (weather, socio economic levels, public infrastructure or attitudes, etc.)

#### Team Members 

- Alexa Hoynacke 
- Theresa Szoke

#### Final presentation and dashboard:

Our final presentation is available [here.](https://docs.google.com/presentation/d/1dauYWDsVA_TuFciaeeTqlzg6qKlfKbXqYvTsndvt5L0/edit?usp=sharing)
A dashboard accompanying our analysis is available [here.](https://public.tableau.com/app/profile/alexa.hoynacke/viz/DiabetesDashboard_16740856831520/GeneralHealth)


## Analysis
### Data sources:
Our analysis and models are based on data from the CDC’s 2011 and 2015 annual Behavioral Risk Factor Surveillance Survey, or BRFSS.  We specifically leveraged data files shared in [Kaggle](https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system). The Kaggle data files had been converted from SAS format to CSV, making in easier for us to ingest and utilize. We selected the oldest (2011) and most recent (2015) data files from Kaggle so that we could analyze diabetes prevalence and risk over time.


### EDA
In our initial exploratory data analysis, we sought to understand the raw BRFSS data that we had acquired.

We loaded the files into pandas and did some cursory reviews:

- The shape of the dataframes told us that the 2011 survey included 506K survey responses to 454 questions, whereas the 2015 survey included 441K survey responses to 330 questions.
- Running dataframe.describe() told us that column names were mostly unintelligible and that many of the columns had many null records.
- Running value_counts() on selected individual columns was not any more insightful … we needed Subject Matter Expertise!

Fortunately, the CDC publishes codebooks which described the BRFSS survey data in detail. We utilized pandas to extract the BRFSS columns to a list, which we imported to Excel.  Leveraging the code books for the [2011](https://www.cdc.gov/brfss/annual_data/2011/pdf/CODEBOOK11_LLCP.pdf) and [2015](https://www.cdc.gov/brfss/annual_data/2015/pdf/codebook15_llcp.pdf) data sets, we documented our understanding of the survey questions and identified questions of interest that may have a bearing on diabetes risk.  Ideally, if we were data scientists working on this project, we would have access to medical experts who would have advised on our strategy.  Following this detailed review of the raw data, we narrowed down the original data sets to 51 columns of interest, which were available in both the 2011 and 2015 surveys.

As we were only interested in understanding that set of data where the survey respondent clearly answered the question about their history of diabetes, we additionally dropped any rows from the data where the diabetes question was not asked or was not answered definitively.

### Database
Once we narrowed down the BRFSS generalized survey data to the columns and rows of interest for our analysis of diabetes risk factors, we developed the code to extract the source CDC Kaggle csv data, keep only the columns and rows of interest, and utilizing push the resulting data to our AWS RDS postgres database using Sqlalchemy.  See [Diabetes_Data_Prep](Diabetes_Data_Prep.ipynb).  The BRFSS data included a column representing the state of residence of the survey respondent, but the values were encoded with FIPS codes.  We created a second table to decode the FIPS code to the state name.  Our final database schema was as shown below:

![Schema](/Images/DiabetesDB.png)

### Machine Learning Model 
This project is interested in predicting a person's diabetes risk, given reponses to general health and health risk questions.  We would be making use of supervised machine learning models, since we had the data to train and test such models.  During our exploratory analysis, we tried several models including Decision Trees and Random Forest Classifiers.  Since the Random Forest Classifier had better performance (higher accuracy), we quidkly narrowed our focus there.  Near the end of our project, we also tried a [deep learning model](Diabetes_NN_Model.ipynb) (keras model), but this both took much longer to run (over an hour vs ~3 minutes for a Random Forest Classifier) and did not have any better performance.  The below section elaborates on the steps to develop and train the Random Forest Classifier that we settled on. See [Diabetes_ML_Model](Diabetes_ML_Model.ipynb).

#### Preprocessing
Our diabetes database contained 50 potential features and the 1 diabetes target column.  In the data preprocessing, we needed to:
- handle nulls
- separate the y and X data
- scale the X data
- create training and testing data sets

#### Feature Selection and Engineering

The first Random Forest Classifier we ran with all 50 potential features performed well with accuracy over 86%.  However, we were interested in identifying a much smaller number of features - we were thinking to future solution where a very short survey could be completed in a app and provide the user with feedback as to their risk of having diabetes.  We wanted to reduce the number of features while still having high accuracy.  We leveraged feature importance analysis to help identify features to remove from our initial feature set.  The code snippet below from our final machine learning model shows how we used the feature importance to remove columns from our X data:

```
# Based on above importances, reduce the Features to the top 10 most imporantant

index_values = X.columns.to_list()
column_values = ["importance"]
importances = pd.DataFrame(data = rfc.feature_importances_, 
                  index = index_values, 
                  columns = column_values)

importances.sort_values('importance', ascending = False, inplace= True)

# Create a list of the importances after the top 10, which will be dropped from our X data:
cut = importances[10:]
to_cut = cut.index.to_list()

# Create new X data with only important columns

X = X.drop(columns=to_cut)
```
In our initial models we slowly reduced the number of features, from 50 to 20 to 15 to 10, running the models multiple times to ensure the performance was consistent.  We stopped at the below 10 features:

![Final 10 Features](/Images/Final10Features.png)

#### How Model was Trained

After creating the training and testing data sets, we utilized `StandardScaler()` to scale the feature data then we created a simple Random Forest Classifier and ran predictions:
```
scaler = StandardScaler()
# Fitting the Standard Scaler with the training data.
X_scaler = scaler.fit(X_train)

# Scaling the data.
X_train_scaled = X_scaler.transform(X_train)
X_test_scaled = X_scaler.transform(X_test)

# Create and fit RandomForestClassifier
rfc = RandomForestClassifier(n_estimators=128)
rfc.fit(X_train_scaled, y_train)

# Make predictions
predictions = rfc.predict(X_test_scaled)
```
Our models consistently performed with accuracy above 85%.  We focused on reducing features based on feature importances and re-running the model until we were down to 10 key features.

#### Confusion Matrix and Accuracy
Our final results are shown below. Accuracy was still above 85% on the final model:

![Accuracy](/Images/FinalAccuracy.png)

The confusion matrix showed that precision and recall were high:

![Confusion Matrix](/Images/FinalConfusionMatrix.png)

### Dashboard
Our dashboard was created in Tableau and provides an overview of the project, key results from our machine learning model, and an interactive element to look at diabetes prevalence by state and by the top 5 factors associated with diabetes risk.

## Results
### Conclusions
We set out to answer three questions:
1. Can we create a machine learning model capable of predicting a person’s likelihood of having diabetes on the basis of answers to health risk questions?  

We were able to demonstrate that several different models were capable of predicting diabetes based on a few key factors with better than 80% accuracy.  We focused in on the Random Forest Classifier, which had good performance and was fairly efficient to train and test.

2. What are the top factors, available in the health risk survey, which correlate to diabetes risk?

Utilizing the feature importances, we were able to determine the top 10 most important risk factors:
[add image]

3. Do different states have different levels of diabetes prevalence?  If so, what state specific factors might be interesting to evaluate in future studies? (weather, socio economic levels, public infrastructure or attitudes, etc.)

The BRFSS survey data clearly indicated differences in state prevalences.  We were not able to look into the questions of what might cause those differences.

### Recommendations
We would have liked to explore the differences in state level prevalence of diabetes in more detail.  
How could data be used to support a case for a community response to diabetes risk, which could advocate for investments in public infrastructure (parks with exercise trails, education campaigns, etc.) that help not only improve the health of residents of the state, but also reduce the financial burdens of treating diabetes and its related complications.  

Additional data sets to determine causal relationships between diabetes prevalence and public infrastructure would be needed along with access to true subject matter experts to advise on hypotheses and avenues to explore.
