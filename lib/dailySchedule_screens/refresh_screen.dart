import 'package:flutter/material.dart';
import '../dailySchedule_screens/dailySchedule.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

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