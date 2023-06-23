import 'package:flutter/material.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../custom_made_widgets/input_field.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(AddTaskPage_screen(title: 'test'));
}
class AddTaskPage_screen extends StatefulWidget
{
  const AddTaskPage_screen({super.key, required this.title});
  final String title;

  @override
  State<AddTaskPage_screen> createState() => _AddTaskPage_screenState();
}

class _AddTaskPage_screenState extends State<AddTaskPage_screen> {

  DateTime _selectedDate = DateTime.now();
  String _endTime = "09:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context)
  {

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

      body: Container(
        padding: const EdgeInsets.only(left:10, right: 20),
        child: SingleChildScrollView(
          child: Column(
              children:
              [
                Text("Add Task", style: GoogleFonts.lato (textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize:25))),
                MyInputField(title: "Title", hint: "Enter event title here"),
                MyInputField(title: "Note", hint: "Enter event notes here"),
                MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon:Icon(Icons.calendar_today_outlined, color:Colors.grey),
                  onPressed: () {_getDateFromUser();},
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                        title: "Start Date", hint: _startTime,
                        widget: IconButton(
                          onPressed:() {_getTimeFromUser(true);},
                          icon:Icon(Icons.access_time_rounded, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width:12),
                    Expanded(
                      child: MyInputField(
                        title: "End Date", hint: _endTime,
                        widget: IconButton(
                          onPressed:() {_getTimeFromUser(false);},
                          icon:Icon(Icons.access_time_rounded, color: Colors.grey),
                        ),
                      ),
                    ),
                  ]
                ),
              ]

          ),
        ),
      ),
    );
  }

  _getDateFromUser() async
  {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2121)
    );

    if(_pickerDate!= null) {
      setState( () {
        _selectedDate = _pickerDate;
      }
      );
    }
  }

  _getTimeFromUser(bool isStartTime) async
  {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime == null)
      {
        print("Time canceled");
      }
    else if(isStartTime == true)
      {
        setState(() {
          _startTime = _formatedTime;
          }
        );
      }
    else if(isStartTime == false)
      {
        setState(() {
          _endTime = _formatedTime;
          }
        );
      }
  }

  _showTimePicker()
  {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          //_starTime --> 10:30 AM
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        )
    );
  }


}
