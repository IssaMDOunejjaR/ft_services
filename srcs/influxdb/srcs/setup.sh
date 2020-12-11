#! /bin/sh

service influxdb start

influx -execute "create database influxdb"

service influxdb restart