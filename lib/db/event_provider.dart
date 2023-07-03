import 'package:flutter/material.dart';
import '../models/Event.dart';

class EventProvider extends ChangeNotifier {

  List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Event> get eventsOfSelectedDate => _events;

  void addEvent(Event event)
  {
    _events.add(event);
    notifyListeners();
  }

  List<Event> setEventList (List<Event> newList)
  {
    _events = newList;
    return _events;
  }

  void editEvent(Event newEvent, Event oldEvent)
  {
    final index = _events.indexOf(oldEvent);
    if(index != -1) {
      _events[index] = newEvent;
      notifyListeners();
    }
    else
      {
        print('could not find event');
      }
  }

  void deleteEvent(Event oldEvent)
  {
    _events.remove(oldEvent);
    notifyListeners();
  }
}