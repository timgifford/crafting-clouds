#!/usr/bin/env bash

STACK_NAME="crafting-cloud-cf"
CHANGE_SET_NAME=$STACK_NAME"-1"

aws cloudformation execute-change-set \
    --change-set-name $CHANGE_SET_NAME