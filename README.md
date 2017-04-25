## Introduction

Via is a Ruby on Rails application that leverages the Boomerang javascript library in order to measure end-user network performance

## Features
* Captures end-user network performance through a series of small download tests and from the HTML5 Navigation Timing API
* High-level metrics graphs showing end-user network latency and bandwidth averaged by hour
* Searchable listing of Boomerang transactions
* API to export network metrics for further analysis
* Boomerang measurements can be run against the same server where the ViA application is homed or can be run remotely and posted back to the ViA server

## Setup / Configuration
* Clone Git repository and install/run application on server
* Have end users access the ViA /mystatus page to run tests and record metrics
* (alternatively) Embed Boomerang javascript library and configuration in a remote web page and post results back to ViA
* Key Boomerang values are the 'base_url' value and the 'beacon_url' value (see /examples)
  * 'base_url' = where you want your end-users to target for network tests
  * 'beacon_url' = where you want the results of those test posted
* More information on Boomerang can be found using the Boomerang Links below

### Boomerang Links

[Old Boomerang](https://github.com/yahoo/boomerang)

[Current Boomerang](https://github.com/SOASTA/boomerang)

### License

[MIT License](https://github.com/duke-automation/via/blob/master/LICENSE.txt)
