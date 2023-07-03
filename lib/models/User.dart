import '../models/Pet.dart';

class User
{
  String imagePath;
  String name;
  String email;
  String number;

  User({
    this.imagePath = "",
    this.name = "",
    this.email = "",
    this.number = "",
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
  void setNumber(String num)
  {
    number = num;
  }
  String getNumber()
  {
    return number;
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

  void removePet(Pet pet)
  {
    _listOfPets.remove(pet);
  }

  void editPet(Pet oldPet, Pet newPetInfo)
  {
    int index = _listOfPets.indexOf(oldPet);
    _listOfPets[index] = newPetInfo;
  }
}