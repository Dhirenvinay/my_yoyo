import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numberpicker/numberpicker.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String hotelName;
  final String location;
  final int price;
  final String email;
  final String image;

  HotelDetailsScreen({
    required this.hotelName,
    required this.location,
    required this.price,
    required this.email,
    required this.image,
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  DateTime _checkInDate = DateTime.now();
  DateTime _checkOutDate = DateTime.now().add(Duration(days: 1));
  int _currentIntValue = 1;
  int _rooms = 1;
  int _guest = 1;

  Future<void> _selectCheckInDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _checkInDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null && picked != _checkInDate) {
      setState(() {
        _checkInDate = picked;
      });
    }
  }

  Future<void> _selectCheckOutDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _checkOutDate ?? DateTime.now().add(Duration(days: 1)),
        firstDate: DateTime.now().add(Duration(days: 1)),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (picked != null && picked != _checkOutDate) {
      setState(() {
        _checkOutDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    Future<void> addUser(String hotelName, String email,String location, String image,int price ) async {
      try {
        String status = "Pending";
        await FirebaseFirestore.instance.collection('Hotel')
            .add({
          'Title': hotelName,
          'location': location,
          'Description': email,
          'Price': price,
          'userEmail': user.email,
          "Image" : image,
          "checkin": _checkInDate,
          "checkout" : _checkOutDate,
          "guest": _guest,
          "rooms": _rooms,
          "Status": status,
        });
        print('Hotel added successfully!');
      } catch (e) {
        print('Error adding hotel: $e');
      }
    }
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        //  backgroundColor: appBgColor,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text(widget.hotelName, style: TextStyle( color: Colors.white),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 197, 216, 197,),
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Text(widget.hotelName, style: TextStyle(color: Colors.black,
                fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(widget.email,
              style: TextStyle( color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row( children: [Icon(Icons.location_city, color: Colors.black,),
              Text(widget.location, style: TextStyle(fontWeight:  FontWeight.normal, fontSize: 16.0, color: Colors.black,
              ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs.${widget.price}\/Night" , style: TextStyle(fontWeight:  FontWeight.bold,fontSize: 22.0 ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/2.2,
                  child: ElevatedButton(
                    child: Text('Select Check-in Date'),
                    onPressed: _selectCheckInDate,style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 11, 56, 13,),),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2.2,
                  child: ElevatedButton(
                    child: Text('Select Check-out Date'),
                    onPressed: _selectCheckOutDate,style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 11, 56, 13,)),
                  ),
                )
              ],
            ),
           SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("No. of Rooms",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if ( _rooms  > 0) {
                      setState(() {
                        _rooms--;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Icon(Icons.remove),
                  ),
                ),
                //SizedBox(width: 5),
                NumberPicker(
                  value: _rooms,
                  minValue: 0,
                  maxValue: 10,
                  step: 1,
                  itemHeight: 50,
                  itemWidth: 25,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => _rooms = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    if (_rooms < 10) {
                      setState(() {
                        _rooms++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("No. of Guest",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(width: 120),
                GestureDetector(
                  onTap: () {
                    if (_guest > 0) {
                      setState(() {
                        _guest--;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 5),
                NumberPicker(
                  value: _guest,
                  minValue: 0,
                  maxValue: 10,
                  step: 1,
                  itemHeight: 50,
                  itemWidth: 25,
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() => _guest = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    if (_guest < 10) {
                      setState(() {
                        _guest++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),


            Expanded(child: Container()),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const  Color.fromARGB(255, 11, 56, 13,),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed:  ()  {

                  int price = widget.price*_rooms;
                  //print("${widget.price*_rooms}");
                  addUser(widget.hotelName,widget.email,widget.location,widget.image,price);
                 // addUser(widget.hotel);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingConfirmationScreen()));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Booking Confirmed'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/tick.svg',
                              height: 50,
                              width: 50,
                              color: Colors.green,
                            ),
                            SizedBox(height: 16),
                            Text('Your booking has been confirmed.'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg: 'Thank you for booking!',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }, child: const Text("Book Now",  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
            ),

          ],
        ),
      ),

    );

  }
}
