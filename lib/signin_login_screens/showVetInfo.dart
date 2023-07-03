import 'package:flutter/material.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../signin_login_screens/editVetInfo.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class ShowVetInfo extends StatelessWidget
{
  User user;
  VetInfo vet;

  ShowVetInfo({super.key, required this.user, required this.vet});


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MyPetProfiles_screen(user: user, vet: vet)),);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [

            Expanded(
              flex:40,
              child: ProfileWidget(
                imagePath:'https://cdn3.iconfinder.com/data/icons/male-user-icons-2/500/muser-dr-512.png',
                onClicked: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditVetInfo(user: user, vet: vet)),);
                },
              ),
            ),

            Expanded(
              flex: 60,
              child: Column(
                children: [

                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(vet.getDoctorName(), style: TextStyle(fontSize:40, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Text("Location:", style: TextStyle(fontSize:20)),
                        ),

                        SizedBox(width: 60),

                        Center(child: Text(vet.getLocation())),
                      ],
                    ),
                  ),


                  SizedBox(height: 30),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Text("Phone Number:", style: TextStyle(fontSize:20)),
                      ),

                      SizedBox(width: 60),

                      Center(child: Text(vet.getPhoneNumber())),
                    ],
                  ),
                ]
              ),
            ),

          ],
        ),
      ),
    );


  }
}
