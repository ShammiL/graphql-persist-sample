import ballerina/io;
import ballerina/uuid;

Client sClient = check new();

public function addEmployeeData(string first_name, string last_name, string email, 
                                    string phone, string job_title) returns string|error {
    io:println("Hello, World!");

     EmployeeInsert employee1 = {
       employee_id: uuid:createType4AsString(),
       first_name,
       last_name,
       email,
       phone,
       job_title
   };


   string[] employeeIds = check sClient->/employees.post([employee1]);
   io:println("Inserted employee id: " + employeeIds[0]);
   return employeeIds[0];

    // string empId = "e0473646-cf97-4cf0-8cb5-8b5960db8c70";
    // Employee employee = check sClient->/employees/[empId];
    // io:println(employee);

}

public function getEmployeeById(string id) returns EmployeeService|error{
    Employee employee = check sClient->/employees/[id];
    io:println(employee);
    EmployeeService employeeService =  new (employee);
    return employeeService;
} 
