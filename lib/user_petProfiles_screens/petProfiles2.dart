import 'package:flutter/material.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../dailySchedule_screens/dailySchedule.dart';
import '../db/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../db/event_provider.dart';
import '../dailySchedule_screens/event_data_source.dart';
import '../models/User.dart';
import '../models/Pet.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
}
class MyPetProfiles2_screen extends StatelessWidget
{
  final User user;
  final Pet pet;

  const MyPetProfiles2_screen({super.key, required this.user, required this.pet});

  @override
  Widget build(BuildContext context)
  {

    final events = Provider.of<EventProvider>(context).setEventList(pet.getSchedule());

    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
          children: [

            Expanded(
              flex:30,
              child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PetProfileWidget(
                        imagePath: pet.getImagePath(),
                        onClicked:(){},
                      ),
                    ),

                    Text(pet.getName()),
                  ]
              ),
            ),

            Expanded(
              flex:50,
              child: Column(
                  children: [
                    Container(
                      height:300,
                      child: SfCalendar(
                        view: CalendarView.schedule,
                        dataSource: EventDataSource(events),
                        initialSelectedDate: DateTime.now(),
                        scheduleViewSettings: ScheduleViewSettings(
                          hideEmptyScheduleWeek: true,
                          monthHeaderSettings: MonthHeaderSettings(
                            height: 20,
                            textAlign: TextAlign.left,
                            backgroundColor: Colors.white,
                          ),
                          weekHeaderSettings: WeekHeaderSettings(
                            height:20,
                            textAlign: TextAlign.center,
                            backgroundColor: Colors.blue.shade300,
                            weekTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ),
                      ),
                    )


                  ]
              ),
            ),

            Expanded(
              flex: 30,
              child: Column(
                children: [

                  Container(
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Add/Edit Events'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyDailySchedule_screen(user:user,pet:pet)),);},
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

                  Container(
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Vet Information'),
                      onPressed: () {},
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

                  Container(
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Share Pet Profile'),
                      onPressed: () {},
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


                ],
              ),
            ),



          ]
      ),
    );
  }
}
