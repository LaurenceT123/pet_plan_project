import '../models/Event.dart';
import 'dart:io';

class Pet
{
  String imagePath;
  String name;
  String animal;
  String medications;
  String additionalInfo;
  int index;
  File? file;

  Pet({
    this.imagePath = 'https://ih1.redbubble.net/image.2184627757.3464/st,small,507x507-pad,600x600,f8f8f8.u2.jpg',
    this.name = '',
    this.animal = '',
    this.medications = 'No Medications',
    this.additionalInfo = "No Additional Information",
    this.index = 0,
    this.file,
  });

  void setFile(File newFile)
  {
    file = newFile;
  }

  File? getFile()
  {
    return file;
  }

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

  String getMedications()
  {
    return medications;
  }

  void setMedications(String newMeds)
  {
    medications = newMeds;
  }

  String getAdditionalInfo()
  {
    return additionalInfo;
  }

  void setAdditionalInfo(String newInfo)
  {
    additionalInfo = newInfo;
  }



  List <Event> _schedule = [];

  void addEvents(Event e)
  {
    _schedule.add(e);
    print("Pets" + _schedule.length.toString());
  }

  List <Event> getSchedule ()
  {
    return _schedule;
  }

  void EditEvent(Event oldEvent, Event newEvent)
  {
    int index = findEvent(oldEvent);

    if(index != -1)
    {
      _schedule[index] = newEvent;
    }
  }

  int findEvent(Event event)
  {
    int index = -1;
    for(int i = 0; i < _schedule.length; i++)
      {
        if(identical(event, _schedule[i]))
          {
            index = i;
          }
      }

    return index;
  }

  void removeEvent(Event event)
  {
    _schedule.remove(event);
  }


}