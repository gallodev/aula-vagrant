#!/bin/bash
PORT="3306"
echo "init machine .."
echo "verify port: $PORT ..."
echo lsof -i :$PORT
lsof -i :$PORT && mysqld stop -f || echo 'PORT avaible !'
echo "update vagrant ..."
vagrant reload
echo "init RUN vagrant ..."
vagrant up
