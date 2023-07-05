import ballerina/io;
import ballerina/uuid;
import persist_test.store;

store:Client sClient = check new();

type EmployeeWithDepartment record {|
    readonly string employeeId;
    string firstName;
    string lastName;
    string email;
    string phone;
    string jobTitle;
    store:Department department;
|};

type EmployeeDataWithDept record {|
    string firstName;
    string lastName;
    string jobTitle;
    record {|
        string name;
        string description;
    |} department;
|};

public function addEmployeeData(NewEmployee emp) returns Employee|error {
     store:EmployeeInsert emp1 = {
       employeeId: uuid:createType4AsString(),
       firstName: emp.firstName,
       lastName: emp.lastName,
       email: emp.email,
       phone: emp.phone,
       jobTitle: emp.jobTitle,
       departmentDepartmentId: emp.departmentId
   };

    string[] employeeIds = check sClient->/employees.post([emp1]);
    store:Employee employee = check sClient->/employees/[employeeIds[0]];

    return {
        id: employee.employeeId,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        jobTitle: employee.jobTitle,
        departmentId: employee.departmentDepartmentId
    };
}

public function updateEmployeeData(string id, string jobTitle) returns Employee|error{
    store:Employee employee = check sClient->/employees/[id].put({
            jobTitle
        });
    io:println(string `Updated employee record: ${employee.toString()}`);
    return {
        id: employee.employeeId,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        jobTitle: employee.jobTitle,
        departmentId: employee.departmentDepartmentId
    };
}

public function deleteEmployeeData(string id) returns Employee|error{
    store:Employee employee = check sClient->/employees/[id].delete();
    io:println(string `Deleted employee record: ${employee.toString()}`);
    return {
        id: employee.employeeId,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        jobTitle: employee.jobTitle,
        departmentId: employee.departmentDepartmentId
    };
    }
    
public function getEmployeeData(string id) returns Employee|error{
    store:Employee employee = check sClient->/employees/[id];
    io:println(employee);
    return {
        id: employee.employeeId,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        jobTitle: employee.jobTitle,
        departmentId: employee.departmentDepartmentId
    };
}

public function getEmployeeWithDept(string id) returns EmployeeWithDepartment|error{
    EmployeeWithDepartment employee = check sClient->/employees/[id].get();
    io:println(employee);
    return employee;

}

public function getEmployeeWithDeptData(string id) returns EmployeeDataWithDept|error{
    EmployeeDataWithDept employee = check sClient->/employees/[id].get();
    io:println(employee);
    return employee;

}

public function addDepartmentData(DepartmentData dept) returns string|error {
     store:DepartmentInsert department1 = {
       departmentId: uuid:createType4AsString(),
       name: dept.name,
       description: dept.description
   };

   string[] departmentIds = check sClient->/departments.post([department1]);
   io:println("Inserted department id: " + departmentIds[0]);
   return departmentIds[0];
}

public function getDepartmentData(string id) returns DepartmentData|error{
    store:Department dept = check sClient->/departments/[id];
    io:println(dept);
    return {
        id: dept.departmentId,
        name: dept.name,
        description: dept.description
    };
}
