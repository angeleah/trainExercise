Train Exercise
==============

This program reads in CSV files containing train information for various train lines and outputs the train information to the user.

Usage:
------
- Getting Started:
  + Clone the app.
  + cd into the directory.
  + using ruby 2.1.0 ( if using rbenv and you don't have this ruby, after installing, $: gem install bundler)
  + $: bundle install

- To run the specs:
  + follow the steps for getting started.
  + $: rspec

-To run the app:
  + Start the server with either shotgun or ruby.
    - To use shotgun:
      + $ shotgun lib/train_exercise_app.rb
      + navigate to localhost:9393
    - to run with ruby:
      + $ ruby lib/train_exercise_app.rb
      + navigate to localhost:4567
  + Add data:
    - There are two ways to add data.
      + Add data by using the form to add a single row of train data.
      + Use the CSV uploader to upload a CSV file of train data. You can provide this file yourself or use one of the files found at 'spec/fixtures'.
