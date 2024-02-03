



import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'adminlogin.dart';
import 'adminview.dart';
import 'deletehotelforadmin.dart';
import 'hoteldata.dart';

class ManageBookings extends StatefulWidget {
  const ManageBookings({Key? key}) : super(key: key);

  @override
  State<ManageBookings> createState() => _ManageBookingsState();
}


class _ManageBookingsState extends State<ManageBookings> {

  final user = FirebaseAuth.instance.currentUser!;
  late StreamController<QuerySnapshot> _streamController;
  late String _userEmail;
  @override
  void initState() {
    super.initState();
    _userEmail = user.email!;
    _streamController = StreamController<QuerySnapshot>();
    // FirebaseFirestore.instance
    //     .collectionGroup('Hotel')
    //     .where('userEmail', isEqualTo: _userEmail)
    //     .snapshots()
    //     .listen((data) {
    //   _streamController.add(data);
    // });
  }

  void updateBookingStatus(String id, String newStatus) async {
    await FirebaseFirestore.instance
        .collection('Hotel')
        .doc(id)
        .update({'Status': newStatus})
        .then((value) {
      Fluttertoast.showToast(
        msg: 'Hotel status updated to $newStatus',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }).catchError((error) => print('Failed to update hotel status: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        title: const Text('Manage Bookings'),

      ),drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: <Widget>[
          DrawerHeader(
            child: Text('Welcome Admin',style: TextStyle(fontSize: 35,color: Colors.white),),
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 11, 56, 13,),
            ),
          ),

          ListTile(
            title: Text('Hotels View',style: TextStyle(fontSize: 20,color: Colors.black),),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminView()));
              // Handle onTap for Item 1
            },
          ),ListTile(
            title: Text('Add Hotels',style: TextStyle(fontSize: 20,color: Colors.black),),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HotelData()));
              // Handle onTap for Item 1
            },
          ),
          ListTile(
            title: Text('Manage Bookings',style: TextStyle(fontSize: 20,color: Colors.black),),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ManageBookings()));
              // Handle onTap for Item 1
            },
          ),
          ListTile(
            title: Text('Delete Hotels',style: TextStyle(fontSize: 20,color: Colors.black),),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHotel()));
              // Handle onTap for Item 1
            },
          ),
          ListTile(
            title: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.black),),
            onTap: () {

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLogin()));

              // Handle onTap for Item 2
            },
          ),
        ],
      ),
    ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Hotel').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final hotels = snapshot.data!.docs;
            return ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                String image = hotel['Image'];
                String title = hotel['Title'];
                String street = hotel['location'];
                String description = hotel['Description'];
                num price = hotel['Price'];
                Timestamp timestamp = hotel['checkin'];
                DateTime c = timestamp.toDate();
                String check = DateFormat.yMd().format(c);
                Timestamp timestamp1 = hotel['checkout'];
                DateTime o = timestamp1.toDate();
                String out = DateFormat.yMd().format(o);
                int guest = hotel["guest"];
                int room = hotel["rooms"];
                String status = hotel["Status"];

                return SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5.0,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),

                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        street,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 5.0),

                                      Text(
                                        'Price: Rs.${price}/- Per Night',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),

                                      Text(
                                        description,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        status,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 260,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 11, 56, 13,),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: InkWell(

                              onTap: () {
                                String confirm ="Confirm";
                                updateBookingStatus(hotel.id, confirm);
                              },
                              child: const Center(
                                child: Text(
                                  "Confirm Booking",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),


                          Container(

                            width: MediaQuery.of(context).size.width - 260,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 11, 56, 13,),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: InkWell(

                              onTap: () {
                                String cancel ="Cancel";
                                updateBookingStatus(hotel.id, cancel);
                                // deleteBooking(hotel.id);
                              },
                              child: const Center(
                                child: Text(
                                  "Cancel Booking",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error retrieving data');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),

    );
  }
}
