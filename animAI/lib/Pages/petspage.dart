import 'package:animai/Pages/addMyAnimalPage.dart';
import 'package:animai/Pages/cubit/petsPageCubit.dart';
import 'package:animai/data/auth/auth.dart';
import 'package:animai/data/entity/myAnimals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Petspage extends StatefulWidget {
  const Petspage({super.key});

  @override
  State<Petspage> createState() => _PetspageState();
}

class _PetspageState extends State<Petspage> {
  final User? user = Auth().currentUser;
  @override
  void initState() {
    super.initState();
    context.read<PetsPageCubit>().getMyAnimal(user?.email ?? "user emial");
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Hayvanlarım"),automaticallyImplyLeading: false,centerTitle: true,),
      body: BlocBuilder<PetsPageCubit, List<MyAnimals>>(
        builder:(context, myAnimalsList){
          if(myAnimalsList.isNotEmpty){
            return Column(
              children: [
                Container(
                  padding:const EdgeInsets.only(left: 20.0, right: 20),
                  alignment: Alignment.centerLeft,
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Evcil Hayvanlarım",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                          textAlign: TextAlign.left,
                        ),
                        Padding(padding: EdgeInsets.only(top:8.0),
                          child: Text(
                            "Dostların ne durumda ? Onlarla oynamayı unutma!",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0x80000000)),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                      child: Padding(
                      padding:   EdgeInsets.only(left: 8.0, right: 8.0,top: 8.0) ,
                  child: GridView.builder(
                    itemCount: myAnimalsList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2, childAspectRatio: 1/1.8
                    ),
                    itemBuilder:(context, index){
                      var myAnimal = myAnimalsList[index];
                      return GestureDetector(
                        child: Card(
                          color: Color(0xFFFAECDF),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(myAnimal.animalImagUrl,width: 100,height: 200,),
                              Column(
                                children: [
                                  Text(
                                      myAnimal.animalName,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF008580))
                                  ),
                                  Text(
                                      "Yaş = ${myAnimal.animalAge}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                                  ),
                                  Text(
                                      "Doktor muaynesi = ${myAnimal.animalDoctorStatus}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                                  ),
                                  Text(
                                      "Tür = ${myAnimal.animalBreed}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                                  ),
                                  Text(
                                      "Önemli not = ${myAnimal.animalImportantNote}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159)),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
                )
              ],
            );
          }else{
            return Container(
              child: const SizedBox( height: 200, width: 200,
                child: Padding(padding :EdgeInsets.only(left: 15,top:20),
                  child: Card(
                    color: Color(0xFFFAECDF),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                                "Hiç Hayvanın yok mu ?",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF008580))
                            ),
                            Padding(padding :EdgeInsets.only(top:20),
                              child: Text(
                                  "☹",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                              ),
                            ),
                            Padding(padding :EdgeInsets.only(top:5),
                              child: Text(
                                  "Hemen bir tane sahiplen bence.",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                              ),
                            ),
                            Padding(padding :EdgeInsets.only(top:5),
                              child: Text(
                                  "Hem o hemde sen mutlu olursun ",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFD57159))
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                              ),
                ),
              ),
            );
          }
        }
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddMyAnimalPage()));
        },
        child: const Icon(Icons.add),
      ) ,
    );
  }
}


