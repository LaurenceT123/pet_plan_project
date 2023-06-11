import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(
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
    ),
  );
}

class MyCreatePetProfileScreen2 extends StatefulWidget
{
  const MyCreatePetProfileScreen2({super.key, required this.title});
  final String title;

  @override
  State<MyCreatePetProfileScreen2> createState() => _MyCreatePetProfileScreen2State();
}

class _MyCreatePetProfileScreen2State extends State<MyCreatePetProfileScreen2> {

  void _goTo() {
    Navigator.pushNamed(context, '/');

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  //centerTitle:true,
                  background: Image.network('https://previews.123rf.com/images/zagory/zagory1703/zagory170300146/74495534-seamless-background-on-the-topic-of-pet-care-pet-shop-simple-contour-icons-on-a-blue-background.jpg', fit: BoxFit.cover),
                  title: Text('Create Your New Pet Profile!'),
                ),
              ),
            ];
          },


          body:Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'What Pet Are You Planning For?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:35,
                      ),
                    ),
                  ),

                  //Reptiles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap:(){}, //todo
                        child: Ink.image(
                          image: NetworkImage('https://media.istockphoto.com/id/1038723210/photo/turtle-isolated-on-white-background-reptile-species-or-tortoise.jpg?s=170667a&w=0&k=20&c=-e6QKQfzXPON9i2InHjCJD4m0S06ATsT61gcFomeT-E='),
                          width: 250,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  //Fish and Rodents
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap:(){}, //todo
                        child: Ink.image(
                          image: NetworkImage('https://previews.123rf.com/images/mirekkijewski/mirekkijewski1406/mirekkijewski140600157/29583600-goldfish-group-of-fish-on-a-white-background.jpg'),
                          width: 200,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),

                      InkWell(
                        onTap:(){}, //todo
                        child: Ink.image(
                          image: NetworkImage('https://www.wellnessvet.com.hk/wp-content/webpc-passthru.php?src=https://www.wellnessvet.com.hk/wp-content/uploads/2021/12/guinea-pig_1.jpg&nocache=1'),
                          width: 170,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),


                ]
            ),
          ),
        )
    );
  }
}
