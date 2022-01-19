rm -rf ApiClient/
openapi-generator generate -g swift5 -i openapi.yaml -o ApiClient/ --skip-validate-spec
