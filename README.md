## Steps to create/deploy revisions of cloudformation stacks

**Note:** Shell script is also available which will run according to the steps below (`deploy.sh`)

1. Make changes to template files, then validate using:
```
aws cloudformation validate-template --template-body file://scraperCronStack.json
aws cloudformation validate-template --template-body file://scraperCronRules.json
```

2.  If previous commands succeed, package files by running:
```
aws cloudformation package --template-file ./scraperCronRules.json --s3-bucket 'cfstacks-510414441092' --s3-prefix 'scraper-stacks' --output-template-file out/packagedScraperCronRules.json --use-json
```

3. deploy using:
```
aws cloudformation deploy --template-file out/packagedScraperCronRules.json --stack-name scraperCronRules
 ```