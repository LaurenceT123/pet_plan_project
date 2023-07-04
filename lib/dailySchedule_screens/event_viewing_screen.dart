import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../dailySchedule_screens/add_task_bar.dart';
import '../db/event_provider.dart';
import '../dailySchedule_screens/dailySchedule.dart';
import '../models/User.dart';
import '../models/Event.dart';
import '../models/Pet.dart';
import '../models/VetInfo.dart';

class EventViewingPage extends StatelessWidget {
  final User user;
  final Event event;
  final Pet pet;
  final VetInfo vet;

  const EventViewingPage({
    Key? key,
    required this.user,
    required this.event,
    required this.pet,
    required this.vet,
  }) : super(key:key);

  Widget build(BuildContext context) {

    delete()
    {
      final provider = Provider.of<EventProvider> (context, listen:false);
      pet.removeEvent(event);
      provider.deleteEvent(event);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MyDailySchedule_screen(user: user, pet:pet, vet:vet)));

    }

    return Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MyDailySchedule_screen(user: user, pet:pet, vet:vet)));
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        AddTaskPage_screen(event:event, pet: pet, vet:vet, user:user),
                  ),);
                },
              ),

              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  delete();
                },
              ),
            ]
        ),
        body: ListView(
            padding: EdgeInsets.all(32),
            children: <Widget>[

              Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'From',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Row(
                      children: [
                        Text(DateFormat.yMMMEd().format(event.startTime),),
                        SizedBox(width: 10),
                        Text(DateFormat.jm().format(event.startTime),),
                      ],
                    ),

                  ]
              ),

              SizedBox(height: 20),
              Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'To',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Row(
                      children: [
                        Text(DateFormat.yMMMEd().format(event.endTime),),
                        SizedBox(width: 10),
                        Text(DateFormat.jm().format(event.endTime),),
                      ],
                    ),

                  ]
              ),


              SizedBox(height: 32),
              Text(
                event.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 24),

              Container(
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    event.description,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),


            ],
        ),
    );
  }
}