
import 'package:animai/data/entity/myAnimals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsPageCubit extends Cubit<List<MyAnimals>>{
  PetsPageCubit():super(<MyAnimals>[]);

  var collectionMyAnimals = FirebaseFirestore.instance.collection("myAnimalsData");


  Future<void> getMyAnimal()async{
    collectionMyAnimals.snapshots().listen((event){
      var myAnimalsList = <MyAnimals>[];

      var documents = event.docs;
      for(var document in documents){
        var key  = document.id;
        var data = document.data();
        var myAnimal = MyAnimals.fromJson(data, key);
        myAnimalsList.add(myAnimal);
      }


      emit(myAnimalsList);

    });
  }

}