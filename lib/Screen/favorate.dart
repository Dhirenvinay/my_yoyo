

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/bottomnavigation.dart';
import 'luxurybooking.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  late StreamController<QuerySnapshot> _streamController;
  late String _userEmail;
  @override
  void initState() {
    super.initState();
    _userEmail = user.email!;
    _streamController = StreamController<QuerySnapshot>();
    FirebaseFirestore.instance
        .collectionGroup('favorate')
        .where('userEmail', isEqualTo: _userEmail)
        .snapshots()
        .listen((data) {
      _streamController.add(data);
    });
  }

  void deleteBooking(String id) async {
    await FirebaseFirestore.instance
        .collection('favorate')
        .doc(id)
        .delete()
        .then((value) {
      Fluttertoast.showToast(
          msg: 'your Favourite Hotel Has Been Removed',
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
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
       // iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text(
          "Your Favourite",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        // if('Hotel' != )
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
            '\n Your Favourite Hotels are',
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
                    child: Text("You have no Favourite hotels"),
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
                    int price = hotel['Price'];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HotelDetailsScreen(
                              hotelName: title,
                              location: street,
                              price: price,
                              email: description,
                              image: image,
                            ),
                          ),
                        );
                      },

                      child: SizedBox(
                        height: 250,
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

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                deleteBooking(hotel.id);
                              },
                              child: Text('Unfavorate this hotel'),
                            ),
                          ],
                        ),
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
