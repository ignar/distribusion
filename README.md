## Test assignment for Distribusion

[![Build Status](https://travis-ci.org/ignar/distribusion.svg?branch=master)](https://travis-ci.org/ignar/distribusion)

Created for fun and profit

## Demo

![gif](demo.gif)

## Usage

```
$ git clone git@github.com:ignar/distribusion.git
$ docker build -t ignar/distribusion .
$ docker-compose run app
```

## Run tests

```
$ docker-compose run app bundle exec rspec
```
