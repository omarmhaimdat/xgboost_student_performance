import xgboost as xgb
from sklearn.metrics import mean_squared_error
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from coremltools import converters
import matplotlib.pyplot as plt
import matplotlib

def train():
    # Read the csv file
    stpData = pd.read_csv('StudentsPerformance-encoded.csv')

    # split and train
    X, y = stpData.iloc[:,:-3],stpData.iloc[:,-3]
    data_dmatrix = xgb.DMatrix(data=X,label=y)

    # split and test
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=123)
    xg_reg = xgb.XGBRegressor(objective ='reg:squarederror',  learning_rate = 0.1,
                max_depth = 7, alpha = 10, n_estimators = 1000, num_boost_round=1000)

    # test the model accuracy
    xg_reg.fit(X_train,y_train)
    preds = xg_reg.predict(X_test)
    rmse = np.sqrt(mean_squared_error(y_test, preds))
    print("RMSE: %f" % (rmse))

    # Plot the feature importance and the tree
    xgb.plot_tree(xg_reg, num_trees=100)
    xgb.plot_importance(xg_reg)
    fig = matplotlib.pyplot.gcf()
    fig.set_size_inches(150, 100)
    fig.savefig('tree.png')

# Convert and save the model
coreml_model = converters.xgboost.convert(xg_reg)
coreml_model.save('student_performance_math.mlmodel')


if __name__ == '__main__':
    train()
