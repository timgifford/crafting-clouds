#!/usr/bin/env bash

CURRENT_DIR=$(PWD)
TEMPLATE_BODY="file://$CURRENT_DIR/app-changes.yml"
TEMPLATE_PARAMS="file://$CURRENT_DIR/app-params.json"
STACK_NAME="crafting-cloud-cf"
CHANGE_SET_NAME=$STACK_NAME"-1"

echo $CHANGE_SET_NAME
aws cloudformation create-change-set \
    --stack-name $STACK_NAME \
    --change-set-name $CHANGE_SET_NAME \
    --region 'us-east-1' \
    --template-body $TEMPLATE_BODY \
    --parameters $TEMPLATE_PARAMS

