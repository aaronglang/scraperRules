## Steps to create/deploy revisions of cloudformation stacks

**Note:** Shell script is also available which will run according to the steps below (`deploy.sh`)

1.  Make changes to template files, then run:
```
aws cloudformation package --template-file ./scraperCronRules.json --s3-bucket 'cfstacks-510414441092' --s3-prefix 'scraper-stacks' --output-template-file out/packagedScraperCronRules.json --use-json
```

2. deploy using:
```
aws cloudformation deploy --template-file out/packagedScraperCronRules.json --stack-name scraperCronRules
 ```

