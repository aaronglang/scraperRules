#!/bin/bash

echo "Disabled scraper!"
exit 1

TEMPLATE='scraperCronRules.json'
NESTED_TEMPLATE='scraperCronStack.json'
STACK='scraperCronRules'

echo 'Validating templates...'
aws cloudformation validate-template --template-body file://${TEMPLATE}
aws cloudformation validate-template --template-body file://${NESTED_TEMPLATE}
if [ $? -ne 0 ]; then
    echo "Error validating templates for stack: ${STACK}"
    exit $?
fi
echo 'Packaging templates...'
aws cloudformation package --template-file ${TEMPLATE} --s3-bucket 'cfstacks-510414441092' --s3-prefix 'scraper-stacks' --output-template-file out/packaged-"${TEMPLATE}" --use-json
if [ $? -ne 0 ]; then
    echo "Error packaging stack: ${STACK}"
    exit $?
fi
echo "Deploying revisions..."
aws cloudformation deploy --template-file out/packaged-"${TEMPLATE}" --stack-name ${STACK}
if [ $? -ne 0 ]; then
    echo "Error deploying stack: ${STACK}"
    exit $?
fi
echo "Deployment script exiting with exit code: $?"