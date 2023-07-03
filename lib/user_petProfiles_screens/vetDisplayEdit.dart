import 'package:flutter/material.dart';
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
