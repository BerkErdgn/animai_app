class Animals{
  String animalId;
  String animalName;
  String animalImageUrl;
  String animalDetail;

  Animals(
      {required this.animalId, required this.animalName, required this.animalImageUrl, required this.animalDetail}
      );

  factory Animals.fromJson(Map<dynamic,dynamic> json){
    return Animals(
        animalId: json ["animalId"] as String,
        animalName: json ["animalName"] as String,
        animalImageUrl: json ["animalImageUrl"] as String,
        animalDetail: json ["animalDetail"] as String
    );
  }
}