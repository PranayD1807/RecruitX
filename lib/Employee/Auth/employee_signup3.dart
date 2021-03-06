import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helping_hand/Employee/Auth/employee_signup2.dart';
import 'package:helping_hand/Employee/Auth/employee_signup4.dart';
import 'package:helping_hand/Employee/Home/employee_home.dart';
import 'package:helping_hand/Model/user.dart';
import 'package:helping_hand/Services/database_service.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class signup_page3 extends StatefulWidget {
  // const signup_page2({ Key? key }) : super(key: key);
  final String address;
  final String EmployeeName;
  final String EmployeeAge;
  final String contact;
  final String dob;
  final String Bio;
  final String Aadhar;
 final int minSal;
 final int maxSal;
  final  ExpectedJobs;
final String ImgUrl;
  final String Experience;


  const signup_page3(
      {Key key,
      this.address,
      this.EmployeeName,
      this.EmployeeAge,
      this.contact,
      this.dob,
      this.Bio,
      this.Aadhar,

      this.ExpectedJobs,
      this.Experience, this.ImgUrl, this.minSal, this.maxSal})
      : super(key: key);

  @override
  _signup_page3State createState() => _signup_page3State();
}

// ignore: camel_case_types
class _signup_page3State extends State<signup_page3> {
  @override
  String dropdownValue = 'Part Time';
  String dropdownValue2 = 'Morning Shift';
  final _formkey3 = GlobalKey<FormState>();
  final currentlyWorking = TextEditingController();
  final PrefereedJob = TextEditingController();
  final PreferredWork = TextEditingController();
  final Rating = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    currentlyWorking.dispose();
    PrefereedJob.dispose();
    PreferredWork.dispose();
    Rating.dispose();

    super.dispose();
  }

  clearText() {
    currentlyWorking.clear();
    PrefereedJob.clear();
    PreferredWork.clear();
    Rating.clear();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return Form(
      key: _formkey3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: currentlyWorking,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      hintText: 'Currently working at:',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'Preferred Job Type',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Part Time',
                          'Full Time',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'Preferred Work Shift',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue2,
                        elevation: 16,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>[
                          'Morning Shift',
                          'Evening Shift',
                          'Night Shift',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      fixedSize: MaterialStateProperty.all(Size(400,50)),
                    ),
                    onPressed: () {
                      if (_formkey3.currentState.validate()) {
                        DatabaseServices(uid: user.uid).updateEmployeeData(
                            aadhar: widget.Aadhar,
                            isEmployee:
                                Provider.of<UserType>(context, listen: false)
                                    .userAsEmployee,
                            employeeDOB: widget.dob,
                            employeeName: widget.EmployeeName,
                            employeeBio: widget.Bio,
                            employeeAge: widget.EmployeeAge,
                            employeeContactNumber: widget.contact,
                            preferredJobType: dropdownValue,
                            employeeAddress: widget.address,
                            employeeExperience: widget.Experience,
                          minSal: widget.minSal,
                            maxSal: widget.maxSal,
                            currentlyWorkingAt: currentlyWorking.text,
                           imgUrl: widget.ImgUrl,
                          employeeExpectedJobs: widget.ExpectedJobs,
                          employeePreferedShift: dropdownValue2,
                        );
                        clearText();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeHome()),
                        );
                      }
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
