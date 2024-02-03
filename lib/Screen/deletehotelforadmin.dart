import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_yoyo/Screen/hoteldata.dart';
import 'adminlogin.dart';
import 'adminview.dart';
import 'managebookings.dart';

class AdminHotel extends StatefulWidget {
  const AdminHotel({Key? key}) : super(key: key);

  @override
  _AdminHotelState createState() => _AdminHotelState();
}

class _AdminHotelState extends State<AdminHotel> {

  void deleteBooking(String id) async {
    await FirebaseFirestore.instance
        .collection('Hoteldata')
        .doc(id)
        .delete()
        .then((value) {
      Fluttertoast.showToast(
          msg: 'your Hotel Has Been Removed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);


    }).catchError((error) => print('Failed to Remove Hotel: $error'));
  }

  // @override
  // void dispose() {
  //   _streamController.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        title: const Text('Hotel List'),

      ),drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        //backgroundColor: Color.fromARGB(255, 11, 56, 13,),
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
        stream: FirebaseFirestore.instance.collection('Hoteldata').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final hotels = snapshot.data!.docs;
            return ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                String hotelName = hotel['Hotel Name'];
                String location = hotel['location'];
                int price = hotel['Price'];
                String email = hotel['Email'];
                String image = hotel['Image'];

                return SizedBox(
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
                                        hotelName,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        location,
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
                                        email,
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

                      // const SizedBox(
                      //   height: 30,
                      // ),
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
                              "Remove Hotel",
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
                      // ElevatedButton(
                      //   onPressed: () {
                      //     deleteBooking(hotel.id);
                      //     // deleteBooking(hotel.id);
                      //
                      //     // code for cancel button action
                      //   },
                      //   child: Text('Cancel'),
                      // ),
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
