import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'add_task_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../db/event_provider.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../custom_made_widgets/tasks_widget.dart';
import '../dailySchedule_screens/event_viewing_screen.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/Event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
}
class MyDailySchedule_screen extends StatelessWidget
{
  final User user;
  final Pet pet;
  MyDailySchedule_screen({super.key, required this.user, required this.pet});

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context)
  {
    final List<Event> events = Provider.of<EventProvider>(context).setEventList(pet.getSchedule());

    _addDateBar()
    {
      return Container(
        margin: const EdgeInsets.only(top:20, left:20),
        child: DatePicker(
            DateTime.now(),
            height: 200,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.blue.shade400,
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(
              fontSize: 15,
              color:Colors.grey,
            ),
            onDateChange:(date){
              _selectedDate = date;
            }

        ),
      );
    }
    _addTaskBar(Pet pet) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                          style: GoogleFonts.lato(textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25))),
                      Text("Today", style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 20))),
                    ]
                ),
              ),

              GestureDetector(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade400,
                  ),
                  child: Center(child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AddTaskPage_screen(pet:pet),),);
                      },
                      child: Text(
                          "+ Add Task",
                          style: TextStyle(color: Colors.white)))),
                ),
              ),
            ]
        ),
      );
    }

      return Scaffold(
        appBar: AppBar(
        ),

        body: Center(
          child: Column(
              children: [
                _addTaskBar(pet),
                //_addDateBar(),

                SizedBox(height: 30),

                Container(
                  height: 560,
                  child: SfCalendar(
                    view: CalendarView.day,
                    dataSource: EventDataSource(events),
                    initialSelectedDate: DateTime.now(),
                    scheduleViewSettings: ScheduleViewSettings(
                      hideEmptyScheduleWeek: true,
                      monthHeaderSettings: MonthHeaderSettings(
                        monthFormat: 'MMMM, yyyy',
                        height: 100,
                        textAlign: TextAlign.left,
                        backgroundColor: Colors.blue.shade400,
                      ),
                    ),
                    onLongPress: (details) {
                      final provider = Provider.of<EventProvider>(
                          context, listen: false);
                      provider.setDate(details.date!);

                      showModalBottomSheet(
                        context: context,
                        builder: (context) => TasksWidget(pet:pet),
                      );
                    },
                    onTap: (details) {
                      if (details.appointments == null) return;
                      final event = details.appointments!.first;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EventViewingPage(event: event, pet:pet)));
                    },
                  ),
                )

              ]

          ),

        ),
      );
  }

}