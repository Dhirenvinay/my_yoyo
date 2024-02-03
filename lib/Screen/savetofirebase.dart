import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:my_yoyo/widgets/bottomnavigation.dart';

class Save extends StatefulWidget {
  const Save({Key? key}) : super(key: key);
  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  final user = FirebaseAuth.instance.currentUser!;
  late StreamController<QuerySnapshot> _streamController;
  late String _userEmail;
  @override
  void initState() {
    super.initState();
    _userEmail = user.email!;
    _streamController = StreamController<QuerySnapshot>();
    FirebaseFirestore.instance
        .collectionGroup('Hotel')
        .where('userEmail', isEqualTo: _userEmail)
        .snapshots()
        .listen((data) {

      _streamController.add(data);
    });
  }

  void deleteBooking(String id) async {
    await FirebaseFirestore.instance
        .collection('Hotel')
        .doc(id)
        .delete()
        .then((value) {
      Fluttertoast.showToast(
          msg: 'your Booking Has Been Caneled',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);


    }).catchError((error) => print('Failed to delete booking: $error'));
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        //iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text(
          "My Bookings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),

      body: Column(

        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Hello ' + user.email!,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\n Your Bookings are',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                       child: Text("You have no bookings"),
                      );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot hotel = snapshot.data!.docs[index];
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
                      height: 280,
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
                                            description,
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
                                            "$check to $out",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            "No. of Room = $room",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            "No. of Guest = $guest",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            "Your Booking Status is "+ status,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 220,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 11, 56, 13,),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: InkWell(

                              onTap: () { deleteBooking(hotel.id);},
                              child: const Center(
                                child: Text(
                                  "Cancel Booking",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
