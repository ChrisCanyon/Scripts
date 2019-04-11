technologies used:
  Node
   -Chart.js
   -Node-gyp
   -Jquery
   -Mocha for tests
   -ORNL tools:
    AMO-tools-suite
    convert-units
  Electron
  HTML/CSS
  python
  ruby on rails
  HTTP requests
  Heroku

Front end I am responsible for:
  devices page TODO make prettier for presentation
  graph page

Things I have done:
  edit/delete options
  configured amo-tools-suite
  server
    tables for each sensor
    routes to get/post/delete sensor data
    routes to get/post/delete devices //still wip
  function to get data from server
  function to package data by similar timestamps
  git project lead

Issues:
  AMO-tools-suite dependency issues:
    ORNL's tool suite was built on node 9.11.1 and required python version 2.7 as well as node-gyp for precompiling
    solution:
      Used nvm to change node to the correct version
      Used Anaconda to create a python 2.7 environment
      installed a configured node-gyp

  Live/real time data:
    ORNL wanted our app to be able to present data in real time. The problem is that there are multiple sensors and they might not be
    able to connect to a single device
    the solution (my idea):
      create a server that holds sensor data. The devices reading from sensors would upload their data via HTTP POST requests.
      Our app would pull data via HTTP GET requests

  live view on multiple devices:
    ORNL wanted a way for two people to view the same efficiency readouts from different devices. This means that devices need to be synced
    across multiple instances of our app
    the solution:
      use the same server we are using for sensor reading to also host devices. This way anyone with access to the server can pull and view
      and device that exists on the server

  sensor readings might not be on the same clock:
    Because an efficiency calculation requires multiple sensor readings and sensor readings are not guaranteed to be on the same clock,
    it is not possible to determine if sensor reading A is part of the same set of data is B based solely on if A's timestamp == B's timestamp
    solution:
      My algorithm (asynchronous)
      Find the smallest dataset
      Search all of the other sensor datasets for data points with timestamps within a threshold (1 second)
      Repackage all valid sensor readings with the same timestamp
      Return an array of packaged sensor readings

      edge cases:
        multiple readings within the same 1 second threshold
          take closest reading
        a sensor does not have a data point within the threshold
          consider this dataset incomplete and move on to the next //do nothing





Sensor1: [{ sensor_reading: 3.35,
            timestamp: "2019-04-03T23:57:49.000Z"}, ...]
Sensor2: [{ sensor_reading: 12.45,
            timestamp: "2019-04-03T23:57:59.000Z"}, ...]

Processed Sensors: [{ timestamp: "2019-04-03T23:57:59.000Z",
                      Sensor1: 3.35,
                      Sensor2: 12.45},...]






















      asd
