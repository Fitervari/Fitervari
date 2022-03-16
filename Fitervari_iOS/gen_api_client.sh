rm -rf ApiClient/
openapi-generator generate -g swift5 -i ./ApiSpecification/Fitervari.yaml -o ApiClient/ --skip-validate-spec
