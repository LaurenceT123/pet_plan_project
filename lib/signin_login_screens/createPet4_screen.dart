import 'package:flutter/material.dart';
import '../main.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../custom_made_widgets/petProfile_widget.dart';

void main() => runApp(MyCreatePetProfile4(title: 'test'));

class MyCreatePetProfile4 extends StatefulWidget
{
  const MyCreatePetProfile4({super.key, required this.title});
  final String title;

  @override
  State<MyCreatePetProfile4> createState() => _MyCreatePetProfile4State();
}

class _MyCreatePetProfile4State extends State<MyCreatePetProfile4> {

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

    final ScrollController _firstController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Profile Picture'),
      ),

      body: SizedBox(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisCount: 1,
          mainAxisSpacing:10,
          childAspectRatio:2,
          children: <Widget> [

            //DOG PROFILE PICTURES
            Container(
              color: Colors.blue.shade50,
              child: Stack(
                children: [
                  Text('Dog Profile Pictures'),

                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      SizedBox(width:10),

                      PetProfileWidget(
                        imagePath: 'https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9',
                        onClicked: () {},
                      ),

                      SizedBox(width:10),

                      PetProfileWidget(
                        imagePath: 'https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg',
                        onClicked: () {},
                      ),

                      SizedBox(width:10),

                      PetProfileWidget(
                        imagePath: 'https://media.istockphoto.com/id/149425119/photo/german-shepherd-isolated-on-white.jpg?s=612x612&w=0&k=20&c=gvtU0eFUSEFh7BP6MUThYD754CTwiLkTz4ICQhWGgHU=',
                        onClicked: () {},
                      ),

                      SizedBox(width:10),

                      PetProfileWidget(
                        imagePath: 'https://previews.123rf.com/images/kirsanovv/kirsanovv0810/kirsanovv081000038/3693796-a-portrait-of-the-very-shaggy-small-dog-with-intent-look-profile.jpg',
                        onClicked: () {},
                      ),

                      SizedBox(width:10),

                      PetProfileWidget(
                        imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2BZZCOMpTJKljCt84bVU0ejbjG_NTDwYvY40i5HHaAbOOgZUHzryniPpwDHQJ8sftNIqpacetjRA&usqp=CAU&ec=48665698',
                        onClicked: () {},
                      ),
                    ],
                  ),
                ),
                ]
              ),
            ),

            //CAT PROFILE PICTURES
            Container(
              color: Colors.blue.shade50,
              child: Stack(
                  children: [
                    Text('Cat Profile Pictures'),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_640.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://static01.nyt.com/images/2021/09/14/science/07CAT-STRIPES/07CAT-STRIPES-mediumSquareAt3X-v2.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_2x3.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg?crop=0.88847xw:1xh;center,top&resize=1200:*',
                            onClicked: () {},
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),


            //BIRD PROFILE PICTURES
            Container(
              color: Colors.blue.shade50,
              child: Stack(
                  children: [
                    Text('Bird Profile Pictures'),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.animalfunfacts.net/images/stories/pets/birds/budgies_l.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/yMixSt-B9KOLTiNy12J6OGgHVi0=/3000x0/filters:no_upscale():strip_icc()/cockatiels-as-pets-1236728-hero-78cbdaa2b96343a7bd3c11d4117fb931.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/TBuzSr4yroPEAXMxw2rQnq3WB8k=/5075x0/filters:no_upscale():strip_icc()/GettyImages-522664558-58a6e85e3df78c345b61ff63.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk3MTEwNDEzMTk0NzAwMDk1/names-for-pet-birds.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/C-RJ019RU4OdiRXWw00DERHJcQc=/1828x0/filters:no_upscale():strip_icc()/pet-bird-price-list-390212-hero-1f4a52b184cb40049b16a67179287f26.jpg',
                            onClicked: () {},
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),

            //REPTITLES PROFILE PICTURES
            Container(
              color: Colors.blue.shade50,
              child: Stack(
                  children: [
                    Text('Reptitles Profile Pictures'),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/B6ON7RJA-kGViF6wnQ2FTBcBJ6w=/2121x0/filters:no_upscale():strip_icc()/GettyImages-487494818-9e5087a02d154515aabe5dd40f7449b9.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/IZBPxMH-M6vlxRSdRnOm4_v455k=/2121x0/filters:no_upscale():strip_icc()/GettyImages-582733896-57b8bc8c5f9b58cdfddc4482.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/CfqhV2fOIbBtxt0jvQbuYzxLMu0=/1280x0/filters:no_upscale():strip_icc()/184220290-56a2bccf3df78cf772796018.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://www.zillarules.com/-/media/project/oneweb/zilla/images/pets/pet-type-images/chrysemys-picta-dorsalis-hatchling-a1.jpg',
                            onClicked: () {},
                          ),

                          SizedBox(width:10),

                          PetProfileWidget(
                            imagePath: 'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1151910235%2F0x0.jpg',
                            onClicked: () {},
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),


              PetProfileWidget(
                imagePath: 'https://e7.pngegg.com/pngimages/676/690/png-clipart-camera-button-computer-icons-camera-photography-circular.png',
                onClicked:() {},
              ),

         ]
        ),
      ),
    );
  }
}
