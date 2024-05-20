import 'package:animai/Pages/cubit/homePageCubit.dart';
import 'package:animai/data/entity/animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().getAnimals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit,List<Animals>>(
        builder: (context,animalsList){
          if(animalsList.isNotEmpty){
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding:const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    alignment: Alignment.centerLeft,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hayvanlar!",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Color(0xFF008580)),
                            textAlign: TextAlign.left,
                          ),
                          Padding(padding: EdgeInsets.only(top:8.0),
                            child: Text(
                              "Haklarında öğreneceğin çok şey var.",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0x80000000)),
                            ),
                          ),
                          Text(
                            "Her gün yeni bilgiler için dönmeyi unutma!",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0x80000000)),
                          ),
                        ]),
                  ),

                  Expanded(child: Padding(
                    padding:   EdgeInsets.only(left: 8.0, right: 8.0,top: 8.0) ,
                    child:ListView.builder(
                      itemCount: animalsList.length,
                      itemBuilder: (context,index){
                        var animal = animalsList[index];
                        print(animal);
                        return GestureDetector(
                          onTap: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalDetailScreen(animal: animal)));
                          },
                          child: Card(
                            color: Color(0xFFFAECDF),
                            child: SizedBox( height: 150,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: const EdgeInsets.only(left: 5.0, right: 16.0,top: 10.0, bottom: 10.0 ) ,
                                      child: Image.network(animal.animalImageUrl,height: 100, width: 120,)),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:9.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              animal.animalName,
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF008580))
                                          ),
                                          Text(
                                            animal.animalDetail,
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFFFD57159)),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ) ,
                  )
                  )
                ],
              ),
            );


          }else{
            return const Center();
          }
        },
      ),
    );
  }
}

