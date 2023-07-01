import 'package:flutter/material.dart';
import '../custom_made_widgets/input_field.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../signin_login_screens/createPetProfile_screen.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import 'petProfiles2.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class VetDisplayEdit extends StatelessWidget
{

  final User user;
  final VetInfo vet;

  VetDisplayEdit({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Vet Information'),

      ),

      body: Container (
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(vet.getDoctorName())

            ]

        ),

      ),
    );

  }

}
