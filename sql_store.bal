import ballerina/io;
import ballerina/uuid;

Client sClient = check new();

public function addEmployeeData(string first_name, string last_name, string email, 
                                    string phone, string job_title) returns string|error {
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
}

public function getEmployeeById(string id) returns EmployeeService|error{
    Employee employee = check sClient->/employees/[id];
    io:println(employee);
    EmployeeService employeeService =  new (employee);
    return employeeService;
} 

public function updateEmployeeData(string id, string first_name, string last_name, string job_title) returns EmployeeService|error {
    Employee employee = check sClient->/employees/[id].put({
            first_name,
            last_name,
            job_title
        });
    EmployeeService employeeService =  new (employee);
    return employeeService;
}

public function deleteEmployeeData(string id) returns EmployeeService|error {
    Employee employee = check sClient->/employees/[id].delete();
    io:println(string `Deleted employee record: ${employee.toString()}`);
    EmployeeService employeeService =  new (employee);
    return employeeService;
}
