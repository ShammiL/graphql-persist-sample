import ballerina/graphql;


public type EmployeeData record {|
    readonly string employee_id;
    string first_name;
    string last_name;
    string email;
    string phone;
    string job_title;
|};

service class EmployeeService {
    private final readonly & EmployeeData employee;

    function init(EmployeeData employee) {
        self.employee = employee.cloneReadOnly();
    }

    resource function get employee_id() returns string {
        return self.employee.employee_id;
    }

    resource function get first_name() returns string {
        return self.employee.first_name;
    }

    resource function get last_name() returns string {
        return self.employee.last_name;
    }

    resource function get email() returns string {
        return self.employee.email;
    }

    resource function get phone() returns string {
        return self.employee.phone;
    }

    resource function get job_title() returns string {
        return self.employee.job_title;
    }
}

service on new graphql:Listener(9000) {

    # A resource for generating greetings
    # + id - the input string id
    # + return - string name with hello message or error
    resource function get employeeById(string id) returns EmployeeService|error {
        return getEmployeeById(id);
    }

    // resource function get allEmployees() returns EmployeeData[] {

    // }
    remote function addEmployee(string first_name, string last_name, string email, 
                                    string phone, string job_title) 
                                    returns string|error {
        return addEmployeeData(first_name, last_name, email, phone, job_title);

    }
}
