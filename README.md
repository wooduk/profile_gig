# README

For example source data in ./data/census-test/adult.data

Include data preparation code in a python script in the directory with the source data. Output a csv that can be taken by the profiler. Code and run this manually (if required)

Next run the profiler on this prepared data

    ./profile.sh data/census_test/adult.data
    
This should generate a directory (named UUID) in the output directory and in it will be a pickle file that is the output of the profiler tool. On this file you can run the report generator as follows.

    ./report.sh E8AB2017-8DB6-41D3-9AEA-0BCEF8BC29A3 asample
    
The first parameter is the UUID assigned above. The second parameter is a passphrase that is used to encrypt the output html.

By default the report generator generates the report html, encrypts it, copys across stylesheets and javascript into the directory with the html and then uploads it to AWS.

You should see the url of the uploaded document echo'd back on completion.


### Setting up the AWS server

    sudo yum install python36 python36-pip

    sudo rm /usr/bin/python

    sudo ln -s /usr/bin/python36 /usr/bin/python

    python -m pip install --user pandas pandas_profiling
    
    sudo yum install git
    
    [set up ssh keys: ssh-keygen then paste to github]
    
    git clone git@github.com:wooduk/profile_gig.git
    
    cd profile_gig
    
    mkdir -p data/census_test
    mkdir output
    

Now start from the top with the actual profiler.

    
    
    
    
    


    

