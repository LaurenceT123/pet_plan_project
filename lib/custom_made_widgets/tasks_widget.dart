import 'package:flutter/material.dart';
import '../db/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../dailySchedule_screens/event_viewing_screen.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class TasksWidget extends StatefulWidget {

  final User user;
  final VetInfo vet;
  final Pet pet;

  const TasksWidget({
    Key? key,
    required this.user,
    required this.pet,
    required this.vet,
  }) : super(key:key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();

}
class _TasksWidgetState extends State<TasksWidget> {

  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
        child: Text('No Events found!',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
  }

    return SfCalendarTheme(
      data: SfCalendarThemeData(
        timeTextStyle: TextStyle(fontSize:16, color: Colors.black),
      ),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight:0,
        onTap: (details) {
          if(details.appointments == null) return;

          final event = details.appointments!.first;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventViewingPage(user: widget.user, event:event, pet:widget.pet, vet:widget.vet),));

        },
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context,
      CalendarAppointmentDetails details,
      ) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
    );

  }


}