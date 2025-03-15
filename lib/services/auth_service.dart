/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  // Sign Up function
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );



      notifyListeners();
      return userCredential;
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  // Sign In function
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print("Sign In Error: $e");
      return null;
    }
  }

  // Sign Out function
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  // 📌 Add this function to retrieve user data
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() as Map<String, dynamic>? : null;
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  /*Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Sign In Error: $e");
      return null;
    }
  }*/

  Future<UserCredential?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print("✅ User Created: ${userCredential.user?.email}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-Up Error: ${e.code} - ${e.message}");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() as Map<String, dynamic>? : null;
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }
}
