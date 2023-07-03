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

  void EditEvent(Event oldEvent, Event newEvent)
  {
    int index = findEvent(oldEvent);
    _schedule[index] = newEvent;
  }

  int findEvent(Event event)
  {
    int index = -1;
    for(int i = 0; i < _schedule.length; i++)
      {
        if(matchEvent(event, _schedule[i]))
          {
            index = i;
          }
      }

    return index;
  }

  bool matchEvent(Event event, Event anotherEvent)
  {
    bool answer = false;
    if(event.getTitle() == anotherEvent.getTitle()
    && event.getDescription() == anotherEvent.getDescription()
    && event.getStartTime() == anotherEvent.getStartTime()
    && event.getEndTime() == anotherEvent.getEndTime())
      {
        return true;
      }

    return answer;
  }

  void removeEvent(Event event)
  {
    _schedule.remove(event);
  }


}