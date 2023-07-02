import '../models/Event.dart';

class Pet
{
  String imagePath;
  String name;
  String animal;
  int index;

  Pet({
    this.imagePath = 'https://ih1.redbubble.net/image.2184627757.3464/st,small,507x507-pad,600x600,f8f8f8.u2.jpg',
    this.name = '',
    this.animal = '',
    this.index = 0,
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

  int getIndex()
  {
    return index;
  }

  void setIndex(int newIndex)
  {
    index = newIndex;
  }



  List <Event> _schedule = [];

  void addEvent(Event e)
  {
    _schedule.add(e);
  }

  List <Event> getSchedule ()
  {
    return _schedule;
  }

  void removeEvent(int index)
  {
    _schedule.remove(index);
  }


}