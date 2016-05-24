# MyLife Digital – Programming Task 2015

## Install

The application itself doesn't have any dependencies so you can run the application once you've cloned the repository.

However, in order to run the tests you will need install a couple of dependencies by running the following command:

```shell
$ bundle install
```

If you don't have bundler installed, you will need to run:

```shell
$ gem install bundler
```

## Running the application

Pass the name of the CSV file you would like to analyse as an argument to the application:

```shell
$ bin/stats <filename.csv>
```

## Running the tests

To run the unit and integration tests, run:

```shell
$ rspec
```
