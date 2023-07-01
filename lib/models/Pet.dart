
class Pet
{
  String imagePath;
  String name;
  String animal;

  Pet({
    this.imagePath = 'https://ih1.redbubble.net/image.2184627757.3464/st,small,507x507-pad,600x600,f8f8f8.u2.jpg',
    this.name = '',
    this.animal = '',
  });

  String getImagePath()
  {
    return imagePath;
  }

  void setImagePath(String newP)
  {
    imagePath = newP;
  }

  String getName()
  {
    return name;
  }

  void setName(String newN)
  {
    name = newN;
  }

  String getAnimal()
  {
    return animal;
  }

  void setAnimal(String newA)
  {
    animal = newA;
  }







}