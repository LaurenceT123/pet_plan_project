import 'package:flutter/material.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../custom_made_widgets/input_field.dart';
import 'dailySchedule.dart';
import 'package:get/get.dart';
import '../models/task.dart';
import '../controllers/task_controller.dart';

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

  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "09:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5,10,15,20];

  String _selectRepeat = "None";
  List<String> repeatList = ["None","Daily","Weekly","Monthly"];

  List<int> index = [0,1,2];
  int _selectedColor = 0;
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
                MyInputField(title: "Title", hint: "Enter event title here", controller: _titleController),
                MyInputField(title: "Note", hint: "Enter event notes here", controller: _noteController),
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

                MyInputField(title: "Remind", hint: "$_selectedRemind minutes early",
                  widget:
                  DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation:4,
                    underline: Container(height:0),
                    items: remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString())
                      );
                    }
                  ).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                ),

                ),


                MyInputField(title: "Repeat", hint: "$_selectRepeat",
                  widget:
                  DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation:4,
                    underline: Container(height:0),
                    items: repeatList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                      );
                    }
                    ).toList(),
                    onChanged: (String? newValue){
                      setState(() {
                        _selectRepeat = newValue!;
                      });
                    },
                  ),

                ),

                SizedBox(height:18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colorPallete(),

                    GestureDetector(
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade400,
                        ),
                        child: Center(child: TextButton(
                            onPressed: () {_validateData();},
                            child:Text(" Create Task", style: TextStyle(color:Colors.white)))),
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

  _colorPallete()
  {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Color", style: GoogleFonts.lato (textStyle: TextStyle(fontSize:15))),
          Container(
            child: Row(
                children:[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = index[0];
                      });
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue.shade400,
                      child: _selectedColor == index[0]? Icon(Icons.done, color: Colors.white, size:16):Container(),
                    ),
                  ),

                  SizedBox(width:5),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = index[1];
                      });
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue.shade200,
                      child: _selectedColor == index[1]? Icon(Icons.done, color: Colors.white, size:16):Container(),
                    ),
                  ),

                  SizedBox(width:5),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = index[2];
                      });
                    },
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue.shade100,
                      child: _selectedColor == index[2]? Icon(Icons.done, color: Colors.white, size:16):Container(),
                    ),
                  ),
                ]
            ),
          ),
        ]
    );
  }

  _validateData()
  {
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty)
      {
        _addTaskToDb();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDailySchedule_screen(title: 'test')),);
      }
    else if(_titleController.text.isEmpty || _noteController.text.isEmpty)
      {
        Get.snackbar("Required", "All fields are required !",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            icon: Icon(Icons.warning_amber_rounded)
        );
      }

  }

  _addTaskToDb() async
  {
    int value = await _taskController.addTask(
        task:Task(
          note: _noteController.text,
          title: _titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          remind: _selectedRemind,
          repeat: _selectRepeat,
          color: _selectedColor,
          isCompleted: 0,
        ),
    );

    print("My id is " + "$value");

  }


}
