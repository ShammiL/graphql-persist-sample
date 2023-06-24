import ballerina/persist as _;

public type Employee record {|
   readonly string employee_id;
   string first_name;
   string last_name;
   string email;
   string phone;
   string job_title;
|};
