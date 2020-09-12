#!/bin/bash

eksctl create cluster \
--name udacity-capstone-project \
--version 1.17 \
--region ap-southeast-2 \
--nodegroup-name udacity-capstone-node-green \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 2 \
--ssh-access \
--managed