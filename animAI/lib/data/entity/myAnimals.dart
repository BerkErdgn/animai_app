
class MyAnimals{
  String animalId;
  String animalAge;
  String animalName;
  String animalSpecies;
  String animalDoctorStatus;
  String petOwner;
  String animalImagUrl;
  String animalBreed;

  MyAnimals(
      {
        required this.animalId,
        required this.animalAge,
        required this.animalName,
        required this.animalSpecies,
        required this.animalDoctorStatus,
        required this.petOwner,
        required this.animalImagUrl,
        required this.animalBreed

      });

  factory MyAnimals.fromJson(Map<dynamic,dynamic> json, String key){
    return MyAnimals(
        animalId: key,
        animalAge: json ["animalAge"] as String? ?? '',
        animalName: json ["animalName"] as String? ?? '',
        animalSpecies: json ["animalSpecies"] as String? ?? '',
        animalDoctorStatus: json ["animalDoctorStatus"] as String? ?? '',
        petOwner: json ["petOwner"] as String? ?? '',
        animalImagUrl: json ["animalImagUrl"] as String? ?? '',
      animalBreed: json ["animalBreed"] as String? ?? '',
    );
  }


}