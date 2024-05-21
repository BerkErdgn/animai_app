import 'loginpage.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profil"),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column (
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset('assets/profile.png',width: 90,height: 90,),
                        TextButton(onPressed:  (){}, child: const Text('Profil resmi değiştir'))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Kullanıcı bilgileri')) ,
                  const SizedBox(height: 40),

                  Row(
                    children: [
                      Expanded(flex: 3, child: Text('İsim',style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
                      Expanded(flex: 5, child: Text('Ayşe Yılmaz',style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
                      const Expanded(child: Icon(Icons.arrow_forward_outlined,size: 18,))
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(flex: 3, child: Text('Kullanıcı Adı',style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
                      Expanded(flex: 5, child: Text('yilmazayse',style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
                      const Expanded(child: Icon(Icons.arrow_forward_outlined,size: 18,))
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(flex: 3, child: Text('Email',style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
                      Expanded(flex: 5, child: Text('ayseyilmaz@gmail.com',style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
                      const Expanded(child: Icon(Icons.arrow_forward_outlined,size: 18,))
                    ],
                  ),
                  const SizedBox(height: 130),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Çıkış Yap", style: TextStyle(color: Colors.red),)),

                ],
              ),
            )
        )
    );
  }
}


