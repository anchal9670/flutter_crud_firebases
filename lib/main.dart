import 'package:crud/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          //check for error
          if(snapshot.hasError)
            {
              print("Somrthing went wrong");
            }
        if(snapshot.connectionState==ConnectionState.done)
          return  MaterialApp(
            title: 'Flutter Firestor CRUD',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        return Center(child: CircularProgressIndicator());
        },
    );





  }
}

