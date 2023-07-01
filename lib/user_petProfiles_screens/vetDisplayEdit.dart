import 'package:flutter/material.dart';
import '../custom_made_widgets/input_field.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../signin_login_screens/createPetProfile_screen.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import 'petProfiles2.dart';
import '../models/User.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class VetDisplayEdit extends StatelessWidget
{

  final User user;

  VetDisplayEdit({super.key, required this.user});

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

            ]

        ),

      ),
    );

  }

}
