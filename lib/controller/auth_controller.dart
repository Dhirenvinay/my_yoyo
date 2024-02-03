
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../Screen/body.dart';
import '../constant.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  late  Rx<File?> _pickedImage;
  File? get profilePhoto => _pickedImage.value;

  @override

  void loginUser(BuildContext context,String email, String password) async {
    try{
      if (email.isNotEmpty &&password.isNotEmpty){
        if(email == "admin@gmail.com")  {
          Get.snackbar("No Authorized","This is admin id" );
        }else
          {
            await firebaseAuth.signInWithEmailAndPassword(
                email: email, password: password);

            print("login auth successfull");
            Get.offAll(Body());
          }
      } else{
        Get.snackbar("Error Loggin in","Please enter all the field" );
      }


    }catch(e){
      Get.snackbar("Error Loggin wrong format", e.toString(),);
    }

  }


}


