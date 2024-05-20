import 'dart:async';

import 'package:animai/Pages/registerPage.dart';
import 'package:animai/data/auth/auth.dart';
import 'package:animai/navigationmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword()async{
    try{
      await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
      Get.to(()=> NavigationMenu());
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hata oluştu: ${errorMessage}")));
      });
    }
    }

  bool sifre_gozukme=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:80, left:20, right:20),
                    child: Text("Hoş Geldin",
                        style: GoogleFonts.inter(
                          color: Color(0xff7f3711),
                          fontSize:40,
                          fontWeight: FontWeight.w500, )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(top:80,bottom: 40,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: TextField(
                      controller: _controllerEmail ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(top:10,bottom: 40,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controllerPassword,
                            obscureText: sifre_gozukme,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Şifre',

                            ),
                          ),
                        ),
                        IconButton(onPressed:  () {
                          setState(() {
                            sifre_gozukme=!sifre_gozukme;
                          });
                        }, icon: Icon(
                          sifre_gozukme ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                        ), color: Color(0xff7f3711),)
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: signInWithEmailAndPassword ,
                    child: Container(
                      margin: EdgeInsets.only(top:10,bottom: 40,right:30,left: 30),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff7f3711),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(0,4),
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: Center (
                          child: Text("Giriş Yap",
                              style: GoogleFonts.inter(
                                  color: Colors.white
                              ))),

                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left:150, right: 10),
                            child: IconButton(onPressed:  () {
                            }, icon: Icon(
                              Icons.facebook_outlined,
                            ), color: Color(0xff7f3711),)
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(),
                            child: IconButton(onPressed:  () {
                            }, icon: Icon(
                              Icons.g_mobiledata_outlined,
                            ), color: Color(0xff7f3711),)
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:30, left:30, right:20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text("Kayıt ol",
                          style: GoogleFonts.inter(
                            color: Color(0xff7f3711),
                            fontSize:15,
                            fontWeight: FontWeight.w500, )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  }
