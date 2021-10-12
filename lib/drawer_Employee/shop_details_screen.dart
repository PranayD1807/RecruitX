import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helping_hand/widgets/newjob.dart';


class ShopDetailsScreen extends StatefulWidget {
  // const ShopDetailsScreen({ Key? key }) : super(key: key);
  final String shopName;
  final String imageurl;
  final String shopType;
  ShopDetailsScreen({this.shopName, this.imageurl, this.shopType});
  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState(
        shopName: shopName,
        shopType: shopType,
        imageurl: imageurl,
      );
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  final String shopName;
  final String imageurl;
  final String shopType;
  _ShopDetailsScreenState({this.shopName, this.imageurl, this.shopType});
  @override
  Widget build(BuildContext context) {
    var jobslist = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(8),
                child: Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Image(
                          image: NetworkImage(imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                shopType + ' Shop',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('Owner'),
                  subtitle: Text('Mellow Works'),
                  // trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Icon(
                    Icons.adjust_outlined,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('Type of shop'),
                  subtitle: Text(shopType),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.work,
                    color: Colors.teal,
                    size: 30,
                  ),
                  title: Text('No of employees hired '),
                  subtitle: Text('30'),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.place_rounded,
                        color: Colors.teal,
                        size: 30,
                      ),

                      title: Text('Shop Address'),
                      // subtitle: Text('30'),
                      trailing: Icon(Icons.edit),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                          'Behind your house, in front of the pole, your ward, your city, your district, India'),
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.work_outline_rounded,
                        color: Colors.teal,
                        size: 30,
                      ),
                      title: Text('Jobs Available'),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            builder: (BuildContext context) {
                              return NewJob();
                            },
                          );
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: min(jobslist * 120, 500),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: ListView(
                          children: <Widget>[
                            JobAvailable(
                              id: '1',
                              job: 'Cashier',
                              salary: '30000',
                              workDays: 'Full Week excluding sun.',
                              workHours: '12:00 am to 5:00 pm',
                              specialRequests:
                                  'Should be able to stay for late night meetings occasionaly',
                            ),
                            JobAvailable(
                              id: '2',
                              job: 'Security Guard',
                              salary: '15,000',
                              workDays: 'Mon, Wed, fri',
                              workHours: '9:00 am to 9:00 pm',
                            ),
                            JobAvailable(
                              id: '3',
                              job: 'Dish Washer',
                              salary: '4000',
                              workDays: 'Sunday, Saturday',
                              workHours: '11:00 am to 5:00 pm',
                              specialRequests:
                                  'Women only. and she should be able to handle 1000 dishes per day',
                            ),
                            JobAvailable(
                              id: '4',
                              job: 'Dresser',
                              salary: '40,000',
                              workDays: 'Complete Week',
                              workHours: '9:00 am to 4:00 pm',
                            ),
                            JobAvailable(
                              id: '5',
                              job: 'Dancer',
                              salary: '20000',
                              workDays: 'Tue, web, thr, fri',
                              workHours: '1:00 pm to 3:00 pm',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobAvailable extends StatefulWidget {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  JobAvailable({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });

  @override
  _JobAvailableState createState() => _JobAvailableState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _JobAvailableState extends State<JobAvailable> {
  final String job;
  final String id;

  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;

  _JobAvailableState({
    this.job,
    this.salary,
    this.workDays,
    this.workHours,
    this.specialRequests,
    this.id,
  });

  var _owner = true;
  @override
  Widget build(BuildContext context) {
    return (_owner)
        ? Dismissible(
            key: ValueKey(id),
            background: Container(
              color: Colors.teal[200],
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
            confirmDismiss: (direction) {
              // return Future.value(true);
              return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text('Are you sure? '),
                        content:
                            Text('Do you want to delete this job posting?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                            child: Text('YES!'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: Text('NO!'),
                          ),
                        ],
                      ));
            },
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            child: InsideBody(
              id: id,
              job: job,
              salary: salary,
              workDays: workDays,
              workHours: workHours,
              specialRequests: specialRequests,
            ),
          )
        : InsideBody(
            id: id,
            job: job,
            salary: salary,
            workDays: workDays,
            workHours: workHours,
            specialRequests: specialRequests,
          );
  }
}

class InsideBody extends StatefulWidget {
  // const InsideBody({ Key? key }) : super(key: key);
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  final String specialRequests;
  InsideBody({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  @override
  _InsideBodyState createState() => _InsideBodyState(
        id: id,
        job: job,
        salary: salary,
        workDays: workDays,
        workHours: workHours,
        specialRequests: specialRequests,
      );
}

class _InsideBodyState extends State<InsideBody> {
  final String id;
  final String job;
  final String salary;
  final String workHours;
  final String workDays;
  String specialRequests;
  _InsideBodyState({
    @required this.id,
    @required this.job,
    @required this.salary,
    @required this.workDays,
    @required this.workHours,
    this.specialRequests,
  });
  var _expanded = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        border: Border.all(width: 3, color: Colors.teal),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                // height: 100,
                child: Column(
                  children: <Widget>[
                    // job title and salary
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              // horizontal: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              job,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            // width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Salary',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(2),
                                  width: 100,
                                  // margin: EdgeInsets.symmetric(vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.teal[100],
                                  ),
                                  child: Text(
                                    'Rs ' + salary,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // working hours
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              padding: EdgeInsets.only(left: 10, right: 15),
                              child: Text(
                                'Working Hours',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(2),
                                // width: 200,
                                // margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.teal[100],
                                ),
                                child: Text(
                                  workHours,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_expanded)
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 0,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // width: 120,
                                padding: EdgeInsets.only(left: 10, right: 15),
                                child: Text(
                                  'Working Days',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  // width: 200,
                                  // margin: EdgeInsets.symmetric(vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.teal[100],
                                  ),
                                  child: Text(
                                    workDays,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (specialRequests != null && _expanded)
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 0,
                          bottom: 10,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.teal[100],
                          border: Border.all(
                            width: 2,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(specialRequests),
                      ),

                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned.fill(
                bottom: -25,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.teal[700],
                          width: 2,
                        ),
                        color: Colors.teal[200],
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Apply Now !',
                        style: TextStyle(
                          color: Colors.teal[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -25,
                right: 20,
                child: IconButton(
                  icon: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.teal[50],
                      child: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                        size: 22,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}