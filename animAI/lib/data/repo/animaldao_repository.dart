import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalDaoRepository{
  var collectionAnimals = FirebaseFirestore.instance.collection("myAnimalsData");

  Future<void> addMyAnimal ( String animalId, String animalAge, String animalName, String animalSpecies, String animalDoctorStatus, String petOwner, String animalImagUrl, String animalBreed, String animalImportantNote) async{
    var newMyAnimal = HashMap<String,dynamic>();
    newMyAnimal["animalId"]="";
    newMyAnimal["animalAge"]=animalAge;
    newMyAnimal["animalName"]=animalName;
    newMyAnimal["animalSpecies"]=animalSpecies;
    newMyAnimal["animalDoctorStatus"]=animalDoctorStatus;
    newMyAnimal["petOwner"]=petOwner;
    newMyAnimal["animalImagUrl"]=animalImagUrl;
    newMyAnimal["animalBreed"]=animalBreed;
    newMyAnimal["animalImportantNote"]= animalImportantNote;
    collectionAnimals.add(newMyAnimal);
  }

}

