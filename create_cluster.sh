#!/bin/bash

eksctl create cluster \
--name udacity-capstone \
--version 1.17 \
--region ap-southeast-2 \
--nodegroup-name project \
--node-type t3.micro \
--nodes 4 \
--nodes-min 2 \
--nodes-max 4 \
--managed