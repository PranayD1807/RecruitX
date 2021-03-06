import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Home/Job-Details/job_list.dart';
import 'package:helping_hand/Employer/Home/Employee-Details/employee_list.dart';
import 'package:sizer/sizer.dart';

class EmployeeOptions extends StatefulWidget {
  const EmployeeOptions({key}) : super(key: key);

  @override
  _EmployeeOptionsState createState() => _EmployeeOptionsState();
}

class _EmployeeOptionsState extends State<EmployeeOptions> {
  // ignore: non_constant_identifier_names
  List<String> employeeFields = [
    "Driver",
    "Watchman",
    "Halwai",
    "Peon",
    "Tutor",
    "Labour",
    "Waiter",
    "Maid",
    "Security Guard",
    "Delivery Boy"
  ];

  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: employeeFields.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeList(
                          text: employeeFields[index],
                          salary: 100000,
                          partTime: false,
                          nightShift: false,
                        ),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.all(2.2.w),
                  child: Card(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            employeeFields[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 4.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
