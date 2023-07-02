import 'package:flutter/material.dart';
import '../db/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../dailySchedule_screens/event_viewing_screen.dart';
import '../models/Event.dart';
import '../models/Pet.dart';
import 'package:intl/intl.dart';
import '../dailySchedule_screens/add_task_bar.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  final Pet pet;

  const EventViewingPage({
    Key? key,
    required this.event,
    required this.pet
  }) : super(key:key);


  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: CloseButton(),
      actions: <Widget> [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AddTaskPage_screen(event: event, pet:pet),
            ),);
          },
        ),

        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ]
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: <Widget> [

        Row(
          children: [
            Expanded(
              flex:4,
              child: Text(
                'From',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Text(DateFormat.yMMMEd().format(event.startTime),),
                SizedBox(width:10),
                Text(DateFormat.jm().format(event.startTime),),
              ],
            ),

          ]
        ),

        SizedBox(height: 20),
        Row(
            children: [
              Expanded(
                flex:4,
                child: Text(
                  'To',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                children: [
                  Text(DateFormat.yMMMEd().format(event.endTime),),
                  SizedBox(width:10),
                  Text(DateFormat.jm().format(event.endTime),),
                ],
              ),

            ]
        ),


        SizedBox(height:32),
        Text(
          event.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.black)),
          ),
          child: Text(
            event.description,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ]
    )
  );
}