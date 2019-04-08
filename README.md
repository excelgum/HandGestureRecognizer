This project is built on Vivado 2019.1 for ECE532 course at University of Toronto.

The goal of this project was to build a system to read hand gestures using Gyro and Accelerometer sensors and then
recognize unique gestures. The calculated gesture state is transmitted via Bluetooth to any mobile device with a bluetooth terminal connection.

The ip_repo contains the core functionality which is the gesture recognizer ip. The rest of the project is built using the
standard microblaze setup with added components. The testbench repo in the handgesture/handgesture.sim folder houses the testbenches for the design.

A demo of the project is posted here:
https://www.dropbox.com/s/p27dpfnjomv9syd/WIN_20190327_20_03_11_Pro.mp4?dl=0
