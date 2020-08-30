#!/bin/bash

eksctl create cluster \
--name udacity-capstone-project-green \
--version 1.17 \
--region ap-southeast-2 \
--nodegroup-name ud-cap-node \
--node-type t3.micro \
--nodes 1 \
--nodes-min 1 \
--nodes-max 1 \
--ssh-access