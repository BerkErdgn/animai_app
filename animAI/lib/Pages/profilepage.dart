import 'package:animai/Pages/loginpage.dart';
import 'package:animai/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profilepage extends StatelessWidget {
  Profilepage({Key? key}): super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body:Center(
        child: Column(
          children: [
            Text(user?.email ?? "User email"),
            ElevatedButton(onPressed: (){
                signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
            }, child: Text("Çıkış"))
          ],
        ),
      )
    );
  }
}


