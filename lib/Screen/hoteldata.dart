import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:my_yoyo/Screen/adminlogin.dart';
import 'package:my_yoyo/Screen/adminview.dart';

import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class HotelData extends StatefulWidget {
  HotelData({Key? key}) : super(key: key);

  @override
  State<HotelData> createState() => _HotelDataState();
}

class _HotelDataState extends State<HotelData> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _price = TextEditingController();
  // TextEditingController _dob = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late  Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;

  // late Rx<File?> file;
  // ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
   // final user = FirebaseAuth.instance.currentUser!;


// ...

    Future<void> addUser(
        String name,
        String location,
        int price,
        String email,
        File? image,
        ) async {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference hotelCollection = firestore.collection('Hoteldata');

      if (image != null) {
        final String fileName = path.basename(image.path);
        final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('hotel_images/$fileName');
        final firebase_storage.UploadTask uploadTask = storageRef.putFile(image);
        final firebase_storage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        final String imageUrl = await taskSnapshot.ref.getDownloadURL();

        await hotelCollection.add({
          "Hotel Name": name,
          "location": location,
          "Price": price,
          "Email": email,
          "Image": imageUrl,
        });
      } else {
        await hotelCollection.add({
          "Hotel Name": name,
          "location": location,
          "Price": price,
          "Email": email,
        });
      }
    }


    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 11, 56, 13,),
        //  backgroundColor: appBgColor,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AdminView())); // Handle the back navigation
          },
        ),
        title: Text("Add Hotels", style: TextStyle( color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),

      body: SingleChildScrollView(
        child: Container(

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Hotels Registeration ",
                style: TextStyle(
                  //backgroundColor: Colors.white,
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                   // backgroundImage: AssetImage('assets/images/user.png'),
                    backgroundColor: Colors.white,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () async {
                        final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(pickedImage != null)
            {
            Get.snackbar("Profile Picture", "You have successfully selected your prole picture");
            }
            _pickedImage = Rx<File?>(File(pickedImage!.path));
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _firstName,
                  keyboardType: TextInputType.emailAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:const BorderSide(
                          color: Colors.black,
                        )),
                    labelText: "First Name",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _location,
                  keyboardType: TextInputType.emailAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    labelText: "State Name",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    labelText: "Price",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:const  BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    labelText: "user email",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _passwordController,
                  //isObscure: true,
                  keyboardType: TextInputType.visiblePassword,



                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    labelText: "Enter your Password",

                    labelStyle: TextStyle(color: Colors.black),

                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),

                    // icon: Icons.email,
                  ),

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 60),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 11, 56, 13,),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: InkWell(
                  onTap: ()  {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminView()));
                      addUser(
                        _firstName.text,
                        _location.text,
                        int.parse(_price.text),
                        _emailController.text,
                        _pickedImage.value,
                      );
                    }).onError((error, stackTrace) {
                      Get.snackbar("Error creating an account", "Please Enter All the fields or user already exist",);
                    });

                  },
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "want to logout",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AdminLogin()));
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.red[400]),
                    ),
                  ),


                ],
              ),

            ],
          ),
        ),
      ),
    );

  }

}
