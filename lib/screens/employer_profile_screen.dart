import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/screens/manage_shops_screen.dart';
import 'package:helping_hand/widgets/newshop.dart';
import 'package:provider/provider.dart';
import '../widgets/newReview.dart';
import '../widgets/shop_refs.dart';

import '../widgets/newjob.dart';

void main() {
  runApp(EmployerProfile());
}

// ignore: camel_case_types
class EmployerProfile extends StatefulWidget {
  @override
  _EmployerProfileState createState() => _EmployerProfileState();
}

// ignore: camel_case_types
class _EmployerProfileState extends State<EmployerProfile> {
  var x = 5;
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<GetUserInfo>(context).fetchAndSetUserinfoForEmployer;
    final reviewers =
        Provider.of<GetUserInfo>(context).fetchAndSetReviews.reviews;
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.teal, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              user.employerName,
              // "Employer",
              style: TextStyle(
                color: Colors.teal[600],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              // report from menu
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.report,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Report',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // top of profile (Dp and BDP )
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://cutewallpaper.org/21/coolest-steam-profile-backgrounds/Discussion-Best-Steam-profile-backgrounds-.jpg',
                                        ),
                                      )),
                                ),
                                Positioned(
                                  bottom: -50,
                                  left: 10,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 48,
                                      backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/originals/9a/25/d8/9a25d86d090fc965a7f9c0ad25668b10.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name of employer
                                          Row(
                                            children: [
                                              Text(
                                                user.employerName,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Icon(
                                                  Icons.verified,
                                                  size: 18,
                                                  color: Colors.blue,
                                                ),
                                              )
                                            ],
                                          ),
                                          // contact number
                                          Text(
                                            user.employerContactNumber,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          // average rating bar
                                          Row(
                                            children: [
                                              Text(
                                                'Rating: ',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              RatingBar.builder(
                                                ignoreGestures: true,
                                                itemSize: 20,
                                                initialRating:
                                                    user.averageRating,
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 1.0,
                                                        vertical: 0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (ctx) {},
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //  Post Job button
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextButton(
                                            onPressed: () {
                                              showModalBottomSheet<void>(
                                                isScrollControlled: true,
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: NewJob(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text('Post Job!'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        // more details
                                        Row(
                                          children: [
                                            Text('Details:'),
                                            IconButton(
                                              icon: Icon(
                                                _expanded
                                                    ? Icons.expand_less
                                                    : Icons.expand_more,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _expanded = !_expanded;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // if clicked on more detail button. --- more details
                        if (_expanded)
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // DOB and age
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // Age
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        // color: Colors.white,
                                        border: Border.all(
                                            width: 2, color: Colors.teal),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Age:',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              user.employerAge,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // D.O.B
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        // color: Colors.teal[100],
                                        border: Border.all(
                                            width: 2, color: Colors.teal),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'D.O.B:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              user.employerDOB,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                // Divider(),
                                // bio and address
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          // color: Colors.teal[100],
                                          border: Border.all(
                                              width: 2, color: Colors.teal),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  'Bio: ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(user.employerBio),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          // color: Colors.teal[100],
                                          border: Border.all(
                                              width: 2, color: Colors.teal),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  'Address: ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    Text(user.employerAddress),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Divider(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // shops
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.teal,
                          size: 30,
                        ),
                        title: Text('Shops'),
                        subtitle: Text('shops owned '),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ManageShops(),
                                      ),
                                    );
                                  }),
                              IconButton(
                                icon: Icon(Icons.add_business_sharp),
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
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: NewShop(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      ShopRefs(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                // reviews
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.chartLine,
                          size: 28,
                          color: Colors.teal,
                        ),
                        title: Text('Reviews'),
                        trailing: IconButton(
                            icon: Icon(Icons.add_comment),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: NewReview(),
                                  );
                                },
                              );
                            }),
                      ),
                      SizedBox(
                        height: 420,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reviewers.length,
                          itemBuilder: (ctx, i) =>
                              ReviewItemForEmployerByEmployee(
                            reviewerId: reviewers[i].reviewerId,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewItemForEmployerByEmployee extends StatelessWidget {
  final String reviewerId;

  ReviewItemForEmployerByEmployee({
    @required this.reviewerId,
  });
  @override
  Widget build(BuildContext context) {
    final loadedreviewer = Provider.of<GetUserInfo>(context)
        .fetchAndSetReviews
        .reviews
        .firstWhere((reviewerEx) => reviewerEx.reviewerId == reviewerId);
    return Container(
      height: 400,
      width: 300,
      margin: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage(loadedreviewer.backgroundImageURL),
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(loadedreviewer.profileImageURL),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.teal,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          loadedreviewer.reviewerName,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        loadedreviewer.jobWorked,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                    ignoreGestures: true,
                    itemSize: 30,
                    initialRating: loadedreviewer.rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (ctx) {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  height: 150,
                  // color: Color.fromRGBO(248, 239, 206, 1),
                  decoration: BoxDecoration(
                      // color: Colors.teal[100],
                      border: Border.all(width: 2, color: Colors.teal),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 30, bottom: 10),
                          child: Text(
                            'Client Review',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Divider(),
                        Container(
                          // height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            loadedreviewer.reviewPara,
                            style: TextStyle(
                              fontSize: 15,

                              // fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}