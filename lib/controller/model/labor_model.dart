class LaborModel{
  final String employid;
  final String employeename;
  final String employeecontact;
  final String role;
  final String availability;
  final String schedule;
  final String task;
  final String field;
  final String seasonaldemand;

  LaborModel({required this.employid, required this.employeename, required this.employeecontact, required this.role, required this.availability, required this.schedule, required this.task, required this.field, required this.seasonaldemand});

  factory LaborModel.fromJson(Map<String, dynamic> json){
    return LaborModel(employid: json['employid'], employeename: json['employeename'], employeecontact: json['employeecontact'], role: json['role'], availability: json['availability'], schedule: json['schedule'], task: json['task'], field: json['field'], seasonaldemand: json['seasonaldemand']);
  }


  Map<String, dynamic> toJson(){
    return {
      "employeeid":employid,
      "employeename":employeename,
      'employeecontact':employeecontact,
      'role':role,
      'availability':availability,
      'schedule':schedule,
      'task':task,
      'field':field,
      'seasonaldemand':seasonaldemand
    };
  }
}