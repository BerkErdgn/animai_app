
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false;


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    child: TextFormField(
                      controller: _emailController,
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
                          child: TextFormField(
                            controller: _passwordController,
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
                    onTap: () {
                      print("Tıklama");
                      _signIn();

                    },
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
                    child: Text("Şifremi Unuttum",
                        style: GoogleFonts.inter(
                          color: Color(0xff7f3711),
                          fontSize:15,
                          fontWeight: FontWeight.w500, )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;



    setState(() {
      _isSigning = false;
    });


  }

}