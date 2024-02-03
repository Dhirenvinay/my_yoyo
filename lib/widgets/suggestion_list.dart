
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoyo/Screen/booking.dart';
import 'package:my_yoyo/utils/ddatabase.dart';
import 'package:my_yoyo/widgets/item_card.dart';



class SuggestionList extends StatefulWidget {
   SuggestionList(this.title, this.hotel, {Key? key}) : super(key: key);
String? title;
   List<Hotel> hotel;
  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       children: [

         Container(
           height: 650.0,
           decoration: BoxDecoration(
             color: Color.fromARGB(255, 197, 216, 197,),
             borderRadius: BorderRadius.circular(12.0),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 2,
                 blurRadius: 5,
                 offset: Offset(5, 5),
               ),
             ],
           ),
    child: ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: widget.hotel.length,
    itemBuilder: (context, index) => Container(

    margin: EdgeInsets.only(bottom: 12.0),

    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    child: ItemCard(widget.hotel[index], () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(widget.hotel[index])));
    }
    ),
    ),
    ),

    ),
         ),

       ],
     ),

   );
  }
}
