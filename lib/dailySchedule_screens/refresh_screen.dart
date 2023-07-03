import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'add_task_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../db/event_provider.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../custom_made_widgets/tasks_widget.dart';
import '../dailySchedule_screens/event_viewing_screen.dart';
import '../user_petProfiles_screens/petProfiles2.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/Event.dart';
import '../models/VetInfo.dart';
import '../dailySchedule_screens/dailySchedule.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
}
class RefreshScreen extends StatelessWidget
{
  final User user;
  final VetInfo vet;
  final Pet pet;
  RefreshScreen({super.key, required this.user, required this.pet, required this.vet});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text('Updating Changes....', style: TextStyle(fontSize: 25),),

              Container(
                width: 300,
                child: ElevatedButton(
                  child: Text('Go Back'),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyDailySchedule_screen(user:user,pet:pet, vet:vet)),);},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                    backgroundColor: MaterialStateProperty.all(Colors.blue.shade300), //background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.blue.shade100)
                        )
                    ),
                  ),
                ),
              ),


            ]
        ),
      ),
    );
  }

}