# graphql-persist-sample

This repository contains a sample code demostrating how Balleina GraphQL and Ballerina Persist modules can be integrated together for storing and querying data from a datastore and exposing them through APIs. 
The implementation uses Ballerina Persist module to store and query data in a MySQL database and then defines a GraphQL service to expose the implemented Persist client.

## Getting Started
* Install [Ballerina](https://ballerina.io/learn/get-started/), this was implemented using Ballerina 2201.6.0
* Install MySQL.
* Install VS Code preferably with the Ballerina extension.
* run `bal run` command inside the root directory

## Execute
Below are some examples you can use to try out the implementation.
```
curl -X POST -H "Content-type: application/json" -d '{"query": "mutation {addEmployee(first_name: \"John\", last_name: \"Doe\", email: \"John@gmail.com\", phone: \"0773829282\", job_title: \"SE\") }"}' 'http://localhost:9000'
```
```
curl -X POST -H "Content-type: application/json" -d '{"query": "{employeeById(id: \"<employee_id>\") {first_name, last_name} }"}' 'http://localhost:9000'
```
```
curl -X POST -H "Content-type: application/json" -d '{"query": "mutation {updateEmployee(employee_id: \"<employee_id>\", first_name: \"Jane\", last_name: \"Green\", job_title: \"SE\") {first_name}}"}' 'http://localhost:9000'
```
```
curl -X POST -H "Content-type: application/json" -d '{"query": "mutation {deleteEmployee(employee_id: \"<employee_id>\") {first_name, last_name} }"}' 'http://localhost:9000'
```

