import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:helping_hand/Employee/Home/Job-Details/job_detail.dart';
import 'package:helping_hand/Employee/Home/employee_filter_button.dart';
import 'package:helping_hand/Employee/Home/employee_searchBar.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../employer_searchBar.dart';
import 'employee_detail.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key key, this.text}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
  final String text;
}

class _EmployeeListState extends State<EmployeeList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation2;
  bool isTapped;
  bool isExpanded;
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  List<String>JobTypes=["Driver","Halwai","Peon","Labour","Tutor","Security Guard","Waiter","Maid","Watchman"];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var tripSnapshot in _allResults) {

        var title = tripSnapshot["name"].toString().toLowerCase();
        print(title);
        // print(title);
        // print(title[0].toString());
        // print(title.map((e)=>title(e)=="Driver"));
        // for(int i=0;i<title.length;i++){
        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
          setState(() {
            isExpanded = true;
          });
        }}

    } else {
      showResults = List.from(_allResults);
      setState(() {
        isExpanded = false;
      });
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    // final user = Provider.of<MyUser>(context);
    var data =
    await FirebaseFirestore.instance.collection('employeeProfile').where("expectedJobs",arrayContains: widget.text).get();
    setState(() {
      _allResults = data.docs;
      print(_allResults.toList());
    });
    searchResultsList();
    return "complete";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF57752),
        brightness: Brightness.dark,
        elevation: 0,
        titleSpacing: 7.w,
        title: Row(
          children: [
            toggler == 0
                ? Text(
                    '${widget.text}',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                : Container(),
            SizedBox(
              width: 3.w,
            )
          ],
        ),
        centerTitle: true,
        actions: [
          EmployerSearchBar(textEditingController: _searchController,),
          EmployeeFilterButton(
            height: 3.h,
            margin: 8.5,
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 100.h,
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, item) {
                      double _w = MediaQuery.of(context).size.width;
                      return Opacity(
                        opacity: _animation.value,
                        child: Transform.translate(
                          offset: Offset(0, _animation2.value),
                          child: InkWell(
                            enableFeedback: true,
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => RouteWhereYouGo(),
                              //     ));

                              setState(() {
                                isTapped = !isTapped;
                              });
                            },
                            onHighlightChanged: (value) {
                              setState(() {
                                isExpanded = value;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 100.h,
                              child: AnimationLimiter(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(_w / 30),
                                  physics: BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  itemCount: _resultsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      delay: Duration(milliseconds: 100),
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 2500),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        horizontalOffset: -300,
                                        verticalOffset: -850,
                                        child: EmployeeExpandedDetails(
                                          index: index,
                                          result: _resultsList[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Color(0xffF57752)
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Color(0xffF57752)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class EmployeeExpandedDetails extends StatefulWidget {
  final int index;
final result;
  const EmployeeExpandedDetails({Key key, this.index, this.result}) : super(key: key);
  @override
  _EmployeeExpandedDetailsState createState() =>
      _EmployeeExpandedDetailsState();
}

class _EmployeeExpandedDetailsState extends State<EmployeeExpandedDetails> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    print("w=${1.w}");
    print("h=${1.h}");

    print("sp=${1.sp}");
    var fetchAndSetUserinfoforEmployee =
        context.watch<GetUserInfo>().fetchAndSetUserinfoForEmployee;
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          onHighlightChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          child: Container(
            height: isTapped ? 11.h : 34.h,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              // height: isTapped
              //     ? isExpanded
              //         ? 65
              //         : 70
              //     : isExpanded
              //         ? 225
              //         : 230,
              // width: isExpanded ? 385 : 390,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 253, 208, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6F12E8).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 21,
                              backgroundImage: NetworkImage(
                                  widget.result['img_url']),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              widget.result['name'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Experience",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.result["experience"]
                                    ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 27,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.result['name'],
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 27,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Hero(
                              tag:  widget.result['img_url'],
                              child: CircleAvatar(
                                radius: 75,
                                backgroundImage: NetworkImage(
                                    widget.result['img_url']),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Average Rating",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.result['averageRating']
                                      .toString(),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Preferred Shift",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.result['preferredShift']
                                    ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Salary Expected",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${widget.result['minExpSalary']}-${widget.result['maxExpSalary']}"),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(35.0, 4, 0, 0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EmployeeDetailScreen(
                                                    result:widget.result),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)))),
                                      child: Text(
                                        "More details",
                                        style:
                                            TextStyle(color: Colors.green[900]),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                        // Text(
                        //   isTapped
                        //       ? ''
                        //       : 'Widgets that have global keys reparent '
                        //           'their subtrees when they are moved from one '
                        //           'location in the tree to another location in '
                        //           'the tree. In order to reparent its subtree, '
                        //           'a widget must arrive at its new location in '
                        //           'the tree in the same animation frame in '
                        //           'which it was removed from its old location '
                        //           'the tree.',
                        //   style: TextStyle(
                        //     color: Colors.white.withOpacity(0.9),
                        //     fontSize: 17,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
