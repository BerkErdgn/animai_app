import 'package:animai/Pages/cubit/addMyAnimalCubit.dart';
import 'package:animai/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMyAnimalPage extends StatefulWidget {
  const AddMyAnimalPage({super.key});

  @override
  State<AddMyAnimalPage> createState() => _AddMyAnimalPageState();
}

class _AddMyAnimalPageState extends State<AddMyAnimalPage> {
  final User? user = Auth().currentUser;

  final TextEditingController _controllerAnimalName = TextEditingController();
  final TextEditingController _controllerAnimalAge = TextEditingController();
  final TextEditingController _controllerAnimalBread = TextEditingController();
  final TextEditingController _controllerAnimalDoctorStatus = TextEditingController();
  final TextEditingController _controllerAnimalImportantNote = TextEditingController();


  String selectedAnimalSpecies = "Dog";

  var animalSpeciesList =[
    "Bear",
    "Dog",
    "Frog",
    "Panda",
    "Penguin",
    "Rabbit",
    "Tiger",
    "bird",
  ];

  void addAnimalHandler(){
    String? errorMessage = "";
    String petOwner = user?.email ?? "User email";
    var animalId ="";
    var animalAge = _controllerAnimalAge.text;
    var animalName =_controllerAnimalName.text;
    var animalSpecies = selectedAnimalSpecies;
    var animalDoctorStatus = _controllerAnimalDoctorStatus.text;
    var animalBreed = _controllerAnimalBread.text;
    var animalImportantNote =_controllerAnimalImportantNote.text;
    var animalImagUrl = "";
    if(selectedAnimalSpecies =="Bear" ){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/bearImage.png?alt=media&token=1e4871ce-3c1a-4a86-a993-1117422e8db2";
    }else if(selectedAnimalSpecies =="Dog"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/dogImage.png?alt=media&token=7c8b3d43-0742-47a9-97d0-6b87d0e95d2e";
    }else if(selectedAnimalSpecies =="Frog"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/frogImage.png?alt=media&token=73418814-cf02-4b18-853c-2a364bb74e69";
    }else if(selectedAnimalSpecies =="Panda"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/pandaImage.png?alt=media&token=5906e184-66a0-4569-a66e-5815dc7c3267";
    }else if(selectedAnimalSpecies =="Penguin"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/penguinImage.png?alt=media&token=b08b73b1-933c-4399-aed8-686e0eb5651e";
    }else if(selectedAnimalSpecies =="Rabbit"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/rabbitImage.png?alt=media&token=6007bfbc-4809-4132-84f6-9493e194ea50";
    }else if(selectedAnimalSpecies =="Tiger"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/tigerImage.png?alt=media&token=5806dc42-a32e-42d5-8b5a-2911c1c6efa8";
    }else if(selectedAnimalSpecies =="bird"){
      animalImagUrl= "https://firebasestorage.googleapis.com/v0/b/animai-5b409.appspot.com/o/birdImage.png?alt=media&token=635b98e2-8d00-4a3f-a6d9-94bb64ed75ea";
    }

    try{
      context.read<AddMyAnimalCubit>().addAnimal(
          animalId,
          animalAge,
          animalName,
          animalSpecies,
          animalDoctorStatus,
          petOwner,
          animalImagUrl,
          animalBreed,
          animalImportantNote
      );
      Navigator.pop(context);
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bir hata oluştu sonra tekrar deneyiniz.")));
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hayvan Kayıt"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[ 
                const Padding( padding: EdgeInsets.only(top:60,right:30,left: 45, bottom: 5),
                    child: Text(
                        "Evcil Hayvan ismi:",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                        textAlign: TextAlign.left
                    )
                ),
                Container(
                decoration: BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(bottom: 20,right:30,left: 30),
                padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                child: TextField(
                  controller: _controllerAnimalName ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Evcil Hayvanınızın ismi',
                  ),
                ),
              ),]
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Padding( padding: EdgeInsets.only(top:5,right:30,left: 45, bottom: 5),
                      child: Text(
                          "Yaş:",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                          textAlign: TextAlign.left
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: TextField(
                      controller: _controllerAnimalAge ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Yaş',
                      ),
                    ),
                  ),]
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Padding( padding: EdgeInsets.only(top:5,right:30,left: 45, bottom: 5),
                      child: Text(
                          "Doktor muaynesi:",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                          textAlign: TextAlign.left
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: TextField(
                      controller: _controllerAnimalDoctorStatus ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Doktor muaynesi',
                      ),
                    ),
                  ),]
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Padding( padding: EdgeInsets.only(top:5,right:30,left: 45, bottom: 5),
                      child: Text(
                          "Cinsi:",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                          textAlign: TextAlign.left
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: TextField(
                      controller: _controllerAnimalBread ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Cinsi',
                      ),
                    ),
                  ),]
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Padding( padding: EdgeInsets.only(top:5,right:30,left: 45, bottom: 5),
                      child: Text(
                          "Önemli Not:",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                          textAlign: TextAlign.left
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 20,right:30,left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15,top: 5, bottom: 5),
                    child: TextField(
                      controller: _controllerAnimalImportantNote ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Önemli Not',
                      ),
                    ),
                  ),]
            ),
            DropdownButton(
              value: selectedAnimalSpecies,
                icon: const Icon(Icons.arrow_drop_down),
                items:  animalSpeciesList.map((oneAnimal){
                  return DropdownMenuItem(value: oneAnimal , child: Text(oneAnimal),);
                }).toList() ,
                onChanged: (data){
                setState(() {
                  selectedAnimalSpecies = data!;
                });

                }
            ),
            InkWell(
              onTap: addAnimalHandler,
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
                    child: Text("Kaydet",
                        style: GoogleFonts.inter(
                            color: Colors.white
                        ))),
        
              ),
            ),

          ],
        ),
      ),
    );
  }
}
