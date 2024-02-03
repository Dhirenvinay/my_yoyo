import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_yoyo/Screen/body.dart';
import 'package:my_yoyo/Screen/login.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _mobilenumber = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future addUser(String firstname, String lastname, int phnnumber, String email) async {
    await FirebaseFirestore.instance.collection("Users").add({
      "First Name": firstname,
      "Last Name": lastname,
      "Mobileno": phnnumber,
      "Email": email,

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 216, 197,),

      body: SingleChildScrollView(
        child: Container(

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/icons/logo.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Signup",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _firstName,

                  keyboardType: TextInputType.text,

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
                height: 15,
              ),
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _lastName,
                  keyboardType: TextInputType.text,

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
                    labelText: "Last Name",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _mobilenumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,

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
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
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
                  ),

                ),
              ),
              const SizedBox(
                height: 15,
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
                  onTap: () =>  {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Body()));
                  addUser(_firstName.text, _lastName.text, int.parse(_mobilenumber.text), _emailController.text);
                  }).onError((error, stackTrace) {
                    Get.snackbar("Error creating an account", "Please Enter All the fields or user already exist",);
                  }),
                },

                  child: const Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
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
                    "Already have an Account ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                      print("Reigstration page is working");
                    },
                    child: Text(
                      "Click Here",
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
