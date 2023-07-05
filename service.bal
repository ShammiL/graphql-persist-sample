import ballerina/graphql;

public type NewEmployee record {|
    string firstName;
    string lastName;
    string email;
    string phone;
    string jobTitle;
    string departmentId;
|};
public type Employee record {|
    *NewEmployee;
    string id;
|};

public type DepartmentData record {|
    readonly string id;
    string name;
    string description;
|};

service on new graphql:Listener(9000) {
    resource function get employee(string id) returns Employee|error {
        return getEmployeeData(id);
    }

    resource function get employeeWithDept(string id) returns EmployeeWithDepartment|error {
        return getEmployeeWithDept(id);
    }

    remote function addEmployee(NewEmployee newEmp) 
                                    returns Employee|error {
        return addEmployeeData(newEmp);

    }

    remote function updateEmployee(string employeeId, string jobTitle) returns Employee|error{
        return updateEmployeeData(employeeId, jobTitle);

    }

    remote function deleteEmployee(string employeeId) returns Employee|error{
        return deleteEmployeeData(employeeId);
    }

    // remote function addDepartment(DepartmentData dept) returns string|error {
    //     return addDepartmentData(dept);
    // }
}