
import 'package:animai/data/repo/animaldao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMyAnimalCubit extends Cubit<void>{
  AddMyAnimalCubit():super(0);

  var arepo = AnimalDaoRepository();

  Future<void> addAnimal( String animalId, String animalAge, String animalName, String animalSpecies, String animalDoctorStatus, String petOwner, String animalImagUrl, String animalBreed, String animalImportantNote) async{
    await arepo.addMyAnimal(animalId, animalAge, animalName, animalSpecies, animalDoctorStatus, petOwner, animalImagUrl, animalBreed, animalImportantNote);
  }


}