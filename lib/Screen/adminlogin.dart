import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_yoyo/Screen/login.dart';

import 'adminview.dart';


class AdminLogin extends StatelessWidget {
  AdminLogin({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  int pass = 123456;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 197, 216, 197,),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              height: 30,
            ),
            const Text(
              "Admin Login",
              style:
              TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(

              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.text,

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
                  labelText: "UserId",
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.number,
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
                  labelText: "Enter your Password",
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 56, 13,),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: InkWell(
                onTap: () {
                  loginWithEmailAndPassword(context,_emailController.text,_passwordController.text);

                },
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                  "Normal User ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen()));
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
    );
  }
  void loginWithEmailAndPassword(BuildContext context,String email, String password) async {
    // Check if the provided email and password match the desired values
    int realpass = int.parse(password);
    if (email == 'admin@gmail.com' && realpass == 12345678) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,

        );
        //
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => HotelData()));

        // User successfully logged in
        User? user = userCredential.user;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminView()));


      }catch (e) {
        // Handle login errors
        print('Login error: $e');
      }
    } else {
      // Email or password is incorrect
      print('Invalid email or password');
    }
  }

}
