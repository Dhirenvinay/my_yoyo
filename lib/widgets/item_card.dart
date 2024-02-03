import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/ddatabase.dart';


class ItemCard extends StatefulWidget {
   ItemCard(this.hotel, this.onTap,{Key? key}) : super(key: key);
Hotel hotel;
Function()? onTap;
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {

      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Future<void> addUser(Hotel hotel) async {
      try {
        await FirebaseFirestore.instance.collection('favorate')
            .add({
          'Title': hotel.title!,
          'location': hotel.location!,
          'Description': hotel.description!,
          'Price': hotel.price!,
          'userEmail': user.email,
          "Image" : hotel.image!,
        });
        print('Hotel added successfully!');
      } catch (e) {
        print('Error adding hotel: $e');
      }
    }
  return Container(
    width: 300.0,
    margin: EdgeInsets.only(right: 20.0),
    decoration: BoxDecoration(
      color: Color(0xfcf9f8),
      borderRadius:BorderRadius.circular(8.0),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: InkWell(
      onTap: widget.onTap,
      child: Padding(padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade200,
              image: DecorationImage(image: NetworkImage(widget.hotel.image!),
                fit: BoxFit.cover,
              )
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(widget.hotel.title!,
          style: TextStyle( color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(widget.hotel.description!,
            style: TextStyle( color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row( children: [Icon(Icons.location_city, color: Colors.grey,),
         Text(widget.hotel.location!, style: TextStyle(fontWeight:  FontWeight.normal, fontSize: 18.0, color: Colors.grey,
         ),
           overflow: TextOverflow.ellipsis,
         )
          ],
          ),
          SizedBox(
            height: 8.0,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rs.${widget.hotel.price}/ Night",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              overflow: TextOverflow.ellipsis,
            ),
            IconButton(
              onPressed: () {_toggleFavorite();
              addUser(widget.hotel);
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
        ],
      ),
      )

    ),

  );
  }
}
