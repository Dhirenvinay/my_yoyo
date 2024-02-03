
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoyo/Screen/booking.dart';
import 'package:my_yoyo/utils/ddatabase.dart';
import 'bottomnavigation.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({Key? key}) : super(key: key);

  @override
  _HotelListPageState createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Hotel> _hotels = Hotel.recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter City',style: TextStyle(color: Colors.white),),
        shadowColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: HotelSearchDelegate(_hotels));
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          final hotel = _hotels[index];
          return GestureDetector(
              onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen( hotel),
              ),
            );
          },
          child: SizedBox(
          height: 180,
          child: Column(
          children: [

          Expanded(child: Card(child: Container(

          padding: EdgeInsets.all(10.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
          Container(
          width: 150,
          height: 170,
          decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage(hotel.image!),
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
          hotel.title!,
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 5.0),
          Text(
          hotel.location!,
          style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 5.0),
          Text(
          hotel.description!,
          style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 5.0),
          Text(
          'Price: Rs.${hotel.price!}/- Per Night',
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

          ),),)
          ],
          ),
          ),
          );

        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

class HotelSearchDelegate extends SearchDelegate<Hotel> {
  final List<Hotel> _hotels;

  HotelSearchDelegate(this._hotels);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear),
        onPressed: () {
        query = '';
          },
          ),
          ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
       // close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _hotels.where((hotel) => hotel.location!.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hotel = results[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen( hotel),
              ),
            );
          },
          child: SizedBox(
            height: 180,
            child: Column(
              children: [
                Expanded(child: Card(child: Container(

                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                    Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(hotel.image!),
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
                              hotel.title!,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              hotel.location!,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              hotel.description!,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Price: Rs.${hotel.price!}/- Per Night',
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

                ),),)
              ],
            ),
          ),

        );
      },

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _hotels
        .where((hotel) => hotel.location!.toLowerCase().contains(query.toLowerCase()))
        .map((hotel) => hotel.location!) // get the location string
        .toSet() // create a set to remove duplicates
        .toList(); // convert back to a list

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final location = suggestions[index];
        return ListTile(
          title: Text(location),
          onTap: () {
            query = location;
            showResults(context);
          },
        );
      },
    );

  }
}