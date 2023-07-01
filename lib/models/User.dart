import '../models/Pet.dart';

class User
{
  String imagePath;
  String name;
  String email;

  User({
    this.imagePath = "",
    this.name = "",
    this.email = "",
  });

  void setImagePath(String newImage)
  {
    imagePath = newImage;
  }
  void setName(String Newname)
  {
    name = Newname;
  }
  void setEmail(String newEmail)
  {
    email = newEmail;
  }

  String getImagePath()
  {
    return imagePath;
  }
  String getName()
  {
    return name;
  }
  String getEmail()
  {
    return email;
  }


  //PET DATA
  final List<Pet> _listOfPets = [];

  int getNumberOfPets()
  {
    return _listOfPets.length;
  }

  List<Pet> getPet()
  {
    return _listOfPets;
  }

  Pet getPetInfo (int index)
  {
    return _listOfPets[index];
  }

  void addPet(Pet pet)
  {
    _listOfPets.add(pet);
  }
}