import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'controller/auth_controller.dart';

var firebaseAuth = FirebaseAuth.instance;
var authController = AuthController.instance;
var fires = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;