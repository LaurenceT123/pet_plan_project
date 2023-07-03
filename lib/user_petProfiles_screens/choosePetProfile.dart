import 'package:flutter/material.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import 'petProfiles2.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyChoosePetProfile extends StatelessWidget
{

  final User user;
  final VetInfo vet;

  MyChoosePetProfile({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
      ),

      body: Container (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom:10),
              child: Text("Select a Pet Profile", textAlign: TextAlign.center,),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: user.getNumberOfPets(),
                itemBuilder: (BuildContext ctx, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          PetProfileWidget(
                            imagePath: user.getPet()[index].getImagePath(),//'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                            onClicked: () {
                              print('Clicked!');

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>new MyPetProfiles2_screen(user:user,pet:user.getPet()[index], vet:vet)),);
                            },
                          ),

                          Text(user.getPet()[index].getName(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]

        ),

      ),
    );

  }

}
