#!/usr/bin/env python

import sys
import pandas as pd
from pandas_profiling import ProfileReport

if len(sys.argv) < 3:
    print('Usage: include source data filename and uuid of run')
    exit()
    
input_filename = sys.argv[1]
output_dir = sys.argv[2]

# perform profiling
df=pd.read_csv(input_filename)
profile = ProfileReport(df)

import pickle
with open(output_dir+'/profile.pkl', 'wb') as f:  
    pickle.dump(profile, f)