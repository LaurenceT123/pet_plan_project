import 'package:flutter/material.dart';
import 'signin_login_screens/signUp_screen.dart';
import 'package:provider/provider.dart';
import '../db/event_provider.dart';

//test
void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  /*Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child: MaterialApp(
    ),
  * */
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to Plan Pet'),

      //Define other routes
      initialRoute: '/',
      routes:
      {
        // When navigating to the "/second" route, build the SecondScreen widget
        '/signUpScreen': (context) => const MySignUpScreen(title: 'sign up page'),
      },
    ),
  );
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _goToSignUp()
  {
    Navigator.pushNamed(context, '/signUpScreen');
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Logo
            Expanded(
              flex:50,
              child: Container(
                width:250,
                height:250,
                child: Image( //For now
                    image: NetworkImage('https://media.istockphoto.com/id/1132462309/vector/paw-logo-of-cat-or-dog-animal-pet-vector-paw-footprint-in-circle-icon.jpg?s=612x612&w=0&k=20&c=Yx76xI62IuvrMwuC048Dq1ZiJEUuMnTjI-I90hd2pbw=')
                ),
              ),
            ),

            // 'Welcome to Plan Pet'
            Expanded(
              flex:10,
              child: Text(
                'Welcome to Plan Pet',
                style: new TextStyle(
                  fontSize: 35.0,
                  ),
                ),
            ),

            //Space between buttons
            SizedBox(height:40),

            Expanded(
              flex:20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 30,
                  child: ElevatedButton(
                    child: Text('Get Started!', style: TextStyle(
                      fontSize: 25,
                    ),),
                    onPressed: _goToSignUp,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                      backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue.shade100)
                          )
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height:40),

          ],
        ),
      ),
    );
  }
}
