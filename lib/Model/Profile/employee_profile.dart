import 'dart:io';

import '../review.dart';

class Employee {
  String uid;
  String employeeName;
  String employeeAddress;
  String employeeContactNumber;
  String employeeBio;
  String employeeAge;
  String employeeDOB;
  String employeeExperience;
  String employeeImage;
  String employeeExpectedSalary;
  dynamic employeeExpectedJobs;
  dynamic applications;
  String currentlyWorkingAt;
  String preferredJobType;
  String employeePreferedShift;
  double averageRating;
  String aadhar;
  int minSal;
  int maxSal;
  bool isEmployee = false;
// non  values
  List<ReviewByEmployer> reviews = [];

  Employee({
    this.uid,
    this.aadhar,
    this.employeeAddress,
    this.employeeAge,
    this.employeeBio,
    this.employeeContactNumber,
    this.employeeExperience,
    this.employeeName,
    this.employeeDOB,
    this.employeeExpectedJobs,
    this.employeeExpectedSalary,
    this.employeePreferedShift,
    this.averageRating,
    this.currentlyWorkingAt,
    this.preferredJobType,
    // non  values
    this.reviews,
    this.isEmployee,
    this.employeeImage,
    this.maxSal,
    this.minSal,
    this.applications
  });
}
