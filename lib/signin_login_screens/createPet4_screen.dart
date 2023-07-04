import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../signin_login_screens/petInfoDisplay.dart';
import 'dart:io';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class MyCreatePetProfile4 extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;
  File? image;

  MyCreatePetProfile4({super.key, required this.user, required this.pet, required this.vet});

  @override
  Widget build(BuildContext context)
  {

    Widget dogProfiles() {
      if (identical(pet.getAnimal(), 'dog')) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Dog Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath(
                                    'https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        PetInfoDisplay(
                                            user: user, pet: pet, vet: vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath(
                                    'https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        PetInfoDisplay(
                                            user: user, pet: pet, vet: vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://media.istockphoto.com/id/149425119/photo/german-shepherd-isolated-on-white.jpg?s=612x612&w=0&k=20&c=gvtU0eFUSEFh7BP6MUThYD754CTwiLkTz4ICQhWGgHU=',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath(
                                  'https://media.istockphoto.com/id/149425119/photo/german-shepherd-isolated-on-white.jpg?s=612x612&w=0&k=20&c=gvtU0eFUSEFh7BP6MUThYD754CTwiLkTz4ICQhWGgHU=');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      PetInfoDisplay(
                                          user: user, pet: pet, vet: vet)),);
                            },
                          ),

                          SizedBox(width: 10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://previews.123rf.com/images/kirsanovv/kirsanovv0810/kirsanovv081000038/3693796-a-portrait-of-the-very-shaggy-small-dog-with-intent-look-profile.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath(
                                  'https://previews.123rf.com/images/kirsanovv/kirsanovv0810/kirsanovv081000038/3693796-a-portrait-of-the-very-shaggy-small-dog-with-intent-look-profile.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      PetInfoDisplay(
                                          user: user, pet: pet, vet: vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2BZZCOMpTJKljCt84bVU0ejbjG_NTDwYvY40i5HHaAbOOgZUHzryniPpwDHQJ8sftNIqpacetjRA&usqp=CAU&ec=48665698',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2BZZCOMpTJKljCt84bVU0ejbjG_NTDwYvY40i5HHaAbOOgZUHzryniPpwDHQJ8sftNIqpacetjRA&usqp=CAU&ec=48665698');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      PetInfoDisplay(
                                          user: user, pet: pet, vet: vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://people.com/thmb/WxJfkZ3MCkXFhY1GgWzuJLqDgDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(1019x626:1021x628)/dog-dating-2522ccf2b0e04f94a29f25fdb81d79af.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath(
                                  'https://people.com/thmb/WxJfkZ3MCkXFhY1GgWzuJLqDgDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(1019x626:1021x628)/dog-dating-2522ccf2b0e04f94a29f25fdb81d79af.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      PetInfoDisplay(
                                          user: user, pet: pet, vet: vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else {
        return SizedBox(height: 0);
      }
    }

      //cat profiles
      Widget catProfiles()
      {
        if(identical(pet.getAnimal(),'cat'))
        {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 200,
              child: Container(
                color: Colors.blue.shade50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Cat Profile Pictures', style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                        )),
                      ),


                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PetProfileWidget(
                                imagePath: 'https://images.unsplash.com/flagged/photo-1557427161-4701a0fa2f42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                                onClicked: () {
                                  pet.setIndex(user.getNumberOfPets());
                                  pet.setImagePath('https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9');
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PetInfoDisplay(
                                          user: user, pet: pet, vet:vet)),);
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PetProfileWidget(
                                imagePath: 'https://media.istockphoto.com/id/1067347086/photo/cat-with-blue-eyes-looks-at-camera.jpg?s=170667a&w=0&k=20&c=bB5AYJqnRkb033JtNOqYYXbHPvv7v4ph7jCD-FvVyZk=',
                                onClicked: () {
                                  pet.setIndex(user.getNumberOfPets());
                                  pet.setImagePath('https://media.istockphoto.com/id/1067347086/photo/cat-with-blue-eyes-looks-at-camera.jpg?s=170667a&w=0&k=20&c=bB5AYJqnRkb033JtNOqYYXbHPvv7v4ph7jCD-FvVyZk=');
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PetInfoDisplay(
                                          user: user, pet: pet, vet:vet)),);
                                },
                              ),
                            ),

                            PetProfileWidget(
                              imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPgIVxg4DvEwjcJrDdttv0uquJZx6awoI7JQ&usqp=CAU',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPgIVxg4DvEwjcJrDdttv0uquJZx6awoI7JQ&usqp=CAU');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet,vet: vet)),);
                              },
                            ),

                            SizedBox(width:10),
                          ]
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PetProfileWidget(
                              imagePath: 'https://provectapet.com/wp-content/uploads/2017/02/provecta_for_pets_cats_hero_550_opt.png',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://provectapet.com/wp-content/uploads/2017/02/provecta_for_pets_cats_hero_550_opt.png');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),

                            PetProfileWidget(
                              imagePath: 'https://burst.shopifycdn.com/photos/beautiful-cat.jpg?width=1200&format=pjpg&exif=1&iptc=1',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://burst.shopifycdn.com/photos/beautiful-cat.jpg?width=1200&format=pjpg&exif=1&iptc=1');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet,vet:vet)),);
                              },
                            ),

                            PetProfileWidget(
                              imagePath: 'https://images.immediate.co.uk/production/volatile/sites/4/2020/05/GettyImages-696252463-c-034e516.jpg?resize=768,574',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://images.immediate.co.uk/production/volatile/sites/4/2020/05/GettyImages-696252463-c-034e516.jpg?resize=768,574');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ]
                      ),


                    ]
                ),
              ),
            ),
          );
        }
        else
        {
          return SizedBox(height:0);
        }
      }

    //bird profiles
    Widget birdProfiles()
    {
      if(identical(pet.getAnimal(),'bird'))
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Bird Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://www.thesprucepets.com/thmb/yMixSt-B9KOLTiNy12J6OGgHVi0=/3000x0/filters:no_upscale():strip_icc()/cockatiels-as-pets-1236728-hero-78cbdaa2b96343a7bd3c11d4117fb931.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://www.thesprucepets.com/thmb/yMixSt-B9KOLTiNy12J6OGgHVi0=/3000x0/filters:no_upscale():strip_icc()/cockatiels-as-pets-1236728-hero-78cbdaa2b96343a7bd3c11d4117fb931.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEa_Fiw-FCH8Sdq6cvDT-_7GJt87e0ugVw-7ZTpbtmYAV4QknRe6K2vKjG7wsa1ESjf-s&usqp=CAU',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEa_Fiw-FCH8Sdq6cvDT-_7GJt87e0ugVw-7ZTpbtmYAV4QknRe6K2vKjG7wsa1ESjf-s&usqp=CAU');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmFRpLjFgJgXVp3kBeS6H1Vd11SFpKFEpzbCZVmYL7jaOLylSPL4kamWViy4jgjmHd2ug&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmFRpLjFgJgXVp3kBeS6H1Vd11SFpKFEpzbCZVmYL7jaOLylSPL4kamWViy4jgjmHd2ug&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet: vet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_wq9_7u7dpetF8Egr_WWhmOu0cczcOjUeRg&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_wq9_7u7dpetF8Egr_WWhmOu0cczcOjUeRg&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML4ZSkvK7D4usoc59BUOaRXVeinlSKgxAb4j3ecNGQlbz6UpuYkk40S9NmnSaY7bofiU&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML4ZSkvK7D4usoc59BUOaRXVeinlSKgxAb4j3ecNGQlbz6UpuYkk40S9NmnSaY7bofiU&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://lafeber.com/pet-birds/wp-content/uploads/2013/07/fischers-lovebird-square-202011.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://lafeber.com/pet-birds/wp-content/uploads/2013/07/fischers-lovebird-square-202011.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else
      {
        return SizedBox(height:0);
      }
    }


    //reptile profiles
    Widget reptileProfiles()
    {
      if(identical(pet.getAnimal(),'reptile'))
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Reptile Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://d2zp5xs5cp8zlg.cloudfront.net/image-59293-800.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://d2zp5xs5cp8zlg.cloudfront.net/image-59293-800.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://www.sheknows.com/wp-content/uploads/2018/08/szqknfx3q7dvprcnm568.jpeg?w=1920',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://www.sheknows.com/wp-content/uploads/2018/08/szqknfx3q7dvprcnm568.jpeg?w=1920');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://www.thesprucepets.com/thmb/B6ON7RJA-kGViF6wnQ2FTBcBJ6w=/2121x0/filters:no_upscale():strip_icc()/GettyImages-487494818-9e5087a02d154515aabe5dd40f7449b9.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://www.thesprucepets.com/thmb/B6ON7RJA-kGViF6wnQ2FTBcBJ6w=/2121x0/filters:no_upscale():strip_icc()/GettyImages-487494818-9e5087a02d154515aabe5dd40f7449b9.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet: vet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://images.saymedia-content.com/.image/t_share/MTk3MDE5MTQ2NzUwMjczMjg1/best-pet-snake-species-for-children-of-any-age.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://images.saymedia-content.com/.image/t_share/MTk3MDE5MTQ2NzUwMjczMjg1/best-pet-snake-species-for-children-of-any-age.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2019_41/1492741/pet-turtle-salmonella-today-main-191011.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2019_41/1492741/pet-turtle-salmonella-today-main-191011.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://www.everythingreptiles.com/wp-content/uploads/2020/04/Pet-Lizards.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://www.everythingreptiles.com/wp-content/uploads/2020/04/Pet-Lizards.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else
      {
        return SizedBox(height:0);
      }
    }

    //fish profiles
    Widget fishProfiles()
    {
      if(identical(pet.getAnimal(),'fish'))
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Fish Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://images.takeshape.io/fd194db7-7b25-4b5a-8cc7-da7f31fab475/dev/bc164934-10ce-4485-827f-0530a28f8282/pietro-jeng-266042-unsplash.jpg?auto=compress%2Cformat&crop=faces&fit=crop&fm=jpg&h=360&q=70&w=540',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://images.takeshape.io/fd194db7-7b25-4b5a-8cc7-da7f31fab475/dev/bc164934-10ce-4485-827f-0530a28f8282/pietro-jeng-266042-unsplash.jpg?auto=compress%2Cformat&crop=faces&fit=crop&fm=jpg&h=360&q=70&w=540');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://www.thesprucepets.com/thmb/InY3TyLjpawOreZ2w0dkJ7QmJGE=/4040x0/filters:no_upscale():strip_icc()/cardinal-tetra-1378417-hero-485f0034557a4a67bb0b63cea50ac917.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://www.thesprucepets.com/thmb/InY3TyLjpawOreZ2w0dkJ7QmJGE=/4040x0/filters:no_upscale():strip_icc()/cardinal-tetra-1378417-hero-485f0034557a4a67bb0b63cea50ac917.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://image.petmd.com/files/styles/863x625/public/goldfish-swimmingtoward_285011336_0.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://image.petmd.com/files/styles/863x625/public/goldfish-swimmingtoward_285011336_0.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet: vet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://ml8ihcapr0bv.i.optimole.com/168zuWE-EgUUYl6c/w:800/h:520/q:75/https://petfishplace.com/media/2019/01/beta.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://ml8ihcapr0bv.i.optimole.com/168zuWE-EgUUYl6c/w:800/h:520/q:75/https://petfishplace.com/media/2019/01/beta.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://microbelift.com/wp-content/uploads/2021/04/BlogBettaFish3.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://microbelift.com/wp-content/uploads/2021/04/BlogBettaFish3.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFfoTPVYULc4Cqs-amxcf0amgK_DT85mFq8bxm9ci8J4mcuTW1gwVkGfyp2G9oMuoCbmg&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFfoTPVYULc4Cqs-amxcf0amgK_DT85mFq8bxm9ci8J4mcuTW1gwVkGfyp2G9oMuoCbmg&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else
      {
        return SizedBox(height:0);
      }
    }


    //rodent profiles
    Widget rodentProfiles()
    {
      if(identical(pet.getAnimal(),'rodent'))
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rodent Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTa6i7xVb-1giFvyxYiEa5Gq_v4pvSvg6oAg&usqp=CAU',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTa6i7xVb-1giFvyxYiEa5Gq_v4pvSvg6oAg&usqp=CAU');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://i.insider.com/5c058eb45930f8333d13ce33?width=700',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://i.insider.com/5c058eb45930f8333d13ce33?width=700');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJA47qSCJywNaB9U6C78Lb7ewViIvLgxmcqdlWPW210TZ2u-xI3qhzbLwxcqwk8Zh58kA&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJA47qSCJywNaB9U6C78Lb7ewViIvLgxmcqdlWPW210TZ2u-xI3qhzbLwxcqwk8Zh58kA&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet: vet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Th6uRIGHAx_74RtJmRjuwAgJbhYEEBjrejRKcG-nPbJWpAJR-Giev0tXPCyAncjM854&usqp=CAU',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Th6uRIGHAx_74RtJmRjuwAgJbhYEEBjrejRKcG-nPbJWpAJR-Giev0tXPCyAncjM854&usqp=CAU');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://today.tamu.edu/wp-content/uploads/2019/06/gettyimages-121689891-170667a-350x267.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://today.tamu.edu/wp-content/uploads/2019/06/gettyimages-121689891-170667a-350x267.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://assets.petco.com/petco/image/upload/f_auto,q_auto/905909-Center-1',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://assets.petco.com/petco/image/upload/f_auto,q_auto/905909-Center-1');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else
      {
        return SizedBox(height:0);
      }
    }

    //other profiles
    Widget otherProfiles()
    {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Other Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://torange.biz/photofxnew/132/IMAGE/frame-circle-horse-beautiful-horses-132516.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://torange.biz/photofxnew/132/IMAGE/frame-circle-horse-beautiful-horses-132516.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://cdn.arstechnica.net/wp-content/uploads/2021/10/GettyImages-120464542-2-800x533.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://cdn.arstechnica.net/wp-content/uploads/2021/10/GettyImages-120464542-2-800x533.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet, vet:vet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://www.everythingreptiles.com/ezoimgfmt/sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_750,h_469/https://www.everythingreptiles.com/wp-content/uploads/2020/08/Whites-Tree-Frog.jpg?ezimgfmt=rs:372x233/rscb1',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://www.everythingreptiles.com/ezoimgfmt/sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_750,h_469/https://www.everythingreptiles.com/wp-content/uploads/2020/08/Whites-Tree-Frog.jpg?ezimgfmt=rs:372x233/rscb1');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet: vet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://www.rainforest-alliance.org/wp-content/uploads/2021/06/capuchin-monkey-square-1.jpg.optimal.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://www.rainforest-alliance.org/wp-content/uploads/2021/06/capuchin-monkey-square-1.jpg.optimal.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://img1.10bestmedia.com/Images/Photos/386313/GettyImages-1036724480_55_660x440.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://img1.10bestmedia.com/Images/Photos/386313/GettyImages-1036724480_55_660x440.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet,vet:vet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://www.cdc.gov/healthypets/images/pets/hedgehog.jpg?_=88696',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://www.cdc.gov/healthypets/images/pets/hedgehog.jpg?_=88696');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet, vet:vet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
    }

    Widget whichOne()
    {
      if(identical(pet.getAnimal(),'dog'))
      {
        return dogProfiles();
      }
      else if(identical(pet.getAnimal(), 'cat'))
        {
          return catProfiles();
        }
      else if (identical(pet.getAnimal(), 'bird'))
        {
          return birdProfiles();
        }
      else if (identical(pet.getAnimal(), 'reptile'))
        {
          return reptileProfiles();
        }
      else if(identical(pet.getAnimal(), 'fish'))
        {
          return fishProfiles();
        }
      else if (identical(pet.getAnimal(), 'rodent'))
        {
          return rodentProfiles();
        }
      else
      {
        return otherProfiles();
      }

    }


    final ScrollController _firstController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Profile Picture'),
      ),

      body: Column(
          children: [

           Expanded(flex: 60, child: whichOne()),

            Expanded(
              flex: 20,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: PetProfileWidget(
                  imagePath: 'https://www.creativefabrica.com/wp-content/uploads/2021/08/07/Image-Gallery-Icon-Graphics-15590538-1-580x386.jpg',
                  onClicked: () async {
                    try {
                      final image = await ImagePicker().pickImage(
                          source: ImageSource.gallery);
                      if (image == null) return;

                      final imageTemporary = File(image.path);
                      this.image = imageTemporary;
                    } catch(e)
                    {
                      print('Failed to pick image: $e');
                    }
                      print('Went through!');
                    if(!(image == null))
                    {
                      pet.setFile(image!);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              PetInfoDisplay(user: user, pet: pet, vet: vet)),);
                    }
                  },
                ),
              ),
            ),
          ]
      ),
    );

  }
}
