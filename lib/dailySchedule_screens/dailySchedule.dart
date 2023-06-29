import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'add_task_bar.dart';
import '../db/db_helper.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../db/event_provider.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../custom_made_widgets/tasks_widget.dart';
import '../dailySchedule_screens/event_viewing_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(MyDailySchedule_screen(title: 'test'));
}
class MyDailySchedule_screen extends StatefulWidget
{
  const MyDailySchedule_screen({super.key, required this.title});
  final String title;
  @override
  State<MyDailySchedule_screen> createState() => _DailyScheduleState();
}

class _DailyScheduleState extends State<MyDailySchedule_screen> {

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context)
  {


    final events = Provider.of<EventProvider>(context).events;

    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => const MyHomePage(title: 'Welcome to Pet Plan'),
      },
    );

    return Scaffold(
      appBar: AppBar(
      ),

      body: Center(
        child:Column(
            children: [
              _addTaskBar(),
              //_addDateBar(),

              SizedBox(height: 30),

              Container(
                height:560,
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
                    final provider = Provider.of<EventProvider>(context, listen: false);
                    provider.setDate(details.date!);

                    showModalBottomSheet(
                      context: context,
                      builder: (context) => TasksWidget(),
                    );
                  },
                  onTap: (details) {
                    if(details.appointments == null) return;
                    final event = details.appointments!.first;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventViewingPage(event:event)));

                    },
                ),
              )

            ]

        ),

      ),
    );
  }

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
  _addTaskBar()
  {
    return Container(
      margin: const EdgeInsets.only(left:20, right:20, top:10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()), style: GoogleFonts.lato (textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize:25))),
                    Text("Today", style: GoogleFonts.lato (textStyle: TextStyle(fontSize:20))),
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
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskPage_screen(),),);},
                    child:Text("+ Add Task", style: TextStyle(color:Colors.white)))),
              ),
            ),
          ]
      ),
    );
  }

}