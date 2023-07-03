import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/Event.dart';
import '../db/event_provider.dart';
import '../models/Pet.dart';
import '../models/VetInfo.dart';
import '../models/User.dart';
import '../dailySchedule_screens/dailySchedule.dart';
import '../dailySchedule_screens/refresh_screen.dart';


class AddTaskPage_screen extends StatefulWidget
{
  final User user;
  final Event? event;
  final VetInfo vet;
  final Pet pet;

  const AddTaskPage_screen({
    Key? key,
    this.event,
    required this.user,
    required this.vet,
    required this.pet
  }) : super(key: key);

  @override
  State<AddTaskPage_screen> createState() => _AddTaskPage_screenState();
}

class _AddTaskPage_screenState extends State<AddTaskPage_screen> {

  //NEW
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;


  void initState()
  {
    super.initState();

    if(widget.event == null)
    {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours:2));
    }
    else
    {
      final event = widget.event!;
      titleController.text = event.title;
      fromDate = event.startTime;
      toDate = event.endTime;
    }
  }

  @override
  void dispose()
  {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: CloseButton(),
      actions: buildEditingActions(),
    ),

    body: SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: <Widget> [

            buildTitle(),
            SizedBox(height:12),
            buildDateTimePickers(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),),

                Container(
                  height: 250,
                  margin: EdgeInsets.only(top:5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade700,
                      width:1.0,
                    ),
                  ),
                  child: TextField(
                    maxLines:null,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: descriptionController,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ),

  );
///////////////////////////////////////////////////////////////////////////
  List<Widget> buildEditingActions() => [
    ElevatedButton.icon(
      onPressed: saveForm,
      icon: Icon(Icons.done),
      label: Text('SAVE'),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    )
  ];

  Widget buildTitle() => TextFormField(
    style: TextStyle(fontSize:24),
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Add Title',
    ),
    onFieldSubmitted: (_) {},
    validator: (title) =>
    title != null && title.isEmpty ? 'Title cannot be empty':null,
    controller: titleController,
  );

/////////////////////////////////////////////////////////////////////////////////////////////
  Widget buildDateTimePickers() => Column (
      children: [
        buildForm(),
        buildTo(),
      ]
  );

  Widget buildForm() => buildHeader(
    header: 'From',
    child: Row(
      children: [
        //Get Start Date
        Expanded(
          flex:2,
          child: buildDropDownField(
            text: DateFormat.yMMMEd().format(fromDate),
            onClicked: () {pickFromDateTime(pickDate: true);},
          ),
        ),

        //Get Start Time
        Expanded(
          child: buildDropDownField(
            text: DateFormat.jm().format(fromDate),
            onClicked: () {pickFromDateTime(pickDate: false);},
          ),
        ),
      ],
    ),
  );

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
          title: Text(text, style: TextStyle(fontSize:15)),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: onClicked
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: TextStyle(fontWeight: FontWeight.bold, fontSize:20)),
        child,
      ]
  );


  Widget buildTo() => buildHeader(
    header: 'To',
    child: Row(
      children: [
        //Get Start Date
        Expanded(
          flex:2,
          child: buildDropDownField(
            text: DateFormat.yMMMEd().format(toDate),
            onClicked: () {pickToDateTime(pickDate: true);},
          ),
        ),

        //Get Start Time
        Expanded(
          child: buildDropDownField(
            text: DateFormat.jm().format(toDate),
            onClicked: () {pickToDateTime(pickDate: false);},
          ),
        ),
      ],
    ),
  );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate:pickDate);
    if(date == null) return;

    if(date.isAfter(toDate)){
      toDate = DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate:pickDate,
      firstDate: pickDate ? fromDate : null,

    );
    if(date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
      DateTime initialDate, {
        required bool pickDate,
        DateTime? firstDate,
      }) async {
    if(pickDate)
    { final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(2015,8),
      lastDate: DateTime(2101),
    );

    if(date == null) return null;

    final time = Duration(hours: initialDate.hour, minutes: initialDate.minute);
    return date.add(time);
    }
    else
    {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if(timeOfDay == null) return null;

      final date = DateTime(initialDate.year, initialDate.month, initialDate.day);

      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

////////////////////////////////////////////////////////////////////////////

  Future saveForm() async
  {
    Pet pet = widget.pet;
    final isValid = _formKey.currentState!.validate();

    if(isValid)
    {
      final event = Event(
        title: titleController.text,
        description: descriptionController.text,
        startTime: fromDate,
        endTime: toDate,
        repeat: false,
      );

      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider> (context, listen:false);

      if(isEditing)
      {
        //provider.editEvent(event, widget.event!);
        pet.EditEvent(widget.event!,event);
        Navigator.push(context, MaterialPageRoute(builder: (
            context) => RefreshScreen(pet:widget.pet, vet: widget.vet, user: widget.user),),);
      }
      else
      {
        //provider.addEvent(event);
        pet.addEvents(event);
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (
            context) => RefreshScreen(pet:widget.pet, vet: widget.vet, user: widget.user),),);
      }
    }
  }

}
