import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  late StreamController<QuerySnapshot> _streamController;
  late String _userEmail;
  @override
  void initState() {
    super.initState();
    _userEmail = user.email!;
    _streamController = StreamController<QuerySnapshot>();
    FirebaseFirestore.instance
        .collection("Users")
        .where('Email', isEqualTo: _userEmail)
        .snapshots()
        .listen((data) {
      _streamController.add(data);
    });
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
          "User Profile",
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
            '\n User Details',
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
                    child: Text("Information not available"),
                  );
                }
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot hotel = snapshot.data!.docs[index];
                    //String image = hotel['Image'];
                    String firstname = hotel['First Name'];
                    String lastname = hotel['Last Name'];
                    num phoneno = hotel['Mobileno'];
                    String email = hotel['Email'];
                    return SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          Expanded(

                            child: Card(
                            //  elevation: 5.0,
                              child: Container(
                                color: Color.fromARGB(255, 197, 216, 197,),
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Full Name  :   "+
                                            firstname + ' ' + lastname,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            'Phone No. :    $phoneno',
                                            style: TextStyle( fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            'Email          :   $email',
                                            style: TextStyle( fontSize: 18.0,
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

