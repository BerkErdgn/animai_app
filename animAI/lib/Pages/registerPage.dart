import 'package:animai/Pages/loginpage.dart';
import 'package:animai/data/auth/auth.dart';
import 'package:animai/navigationmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordVerify = TextEditingController();

  String? errorMessage = "";
  bool sifre_gozukme=false;


  Future<void> createUserWithEmailAndPassword()async{
    try{
      if(_controllerPassword.text == _controllerPasswordVerify.text){
        await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
        Get.to(()=> NavigationMenu());
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Şifreleri yanlış girdiniz")));
      }


    } on FirebaseAuthException catch (e){
        setState(() {
          errorMessage = e.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hata oluştu: ${errorMessage}")));
        });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child: SingleChildScrollView (
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:80, left:20, right:20),
                  child: Text("Kayıt ol",
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
                          controller: _controllerPasswordVerify,
                          obscureText: sifre_gozukme,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tekrar Şifrenizi Giriniz',

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
                  onTap: createUserWithEmailAndPassword ,
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
                        child: Text("Kayıt ol",
                            style: GoogleFonts.inter(
                                color: Colors.white
                            ))),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30, left:30, right:20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("Login sayfasına geri dön.",
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
      ),
    );
  }
}
