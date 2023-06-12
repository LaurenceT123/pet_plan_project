import 'package:flutter/material.dart';
import 'signin_login_screens/login_screen.dart';
import 'signin_login_screens/signUp_screen.dart';
import 'signin_login_screens/createPetProfile_screen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
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
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/loginScreen': (context) => const MyLoginScreen(title: 'login page'),
        '/signUpScreen': (context) => const MySignUpScreen(title: 'sign up page'),
        '/createPetProfile': (context) => const MyCreatePetProfileScreen(title:'Create your new Pet Profile!'),
      },
    );

  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _goToLogin()
  {
    Navigator.pushNamed(context, '/loginScreen');
  }
  void _goToSignUp()
  {
    Navigator.pushNamed(context, '/signUpScreen');
  }
  void _goToCreatePetProfile()
  {
    Navigator.pushNamed(context,'/createPetProfile');
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

            //Create new Pet Profile Button
            Expanded(
              flex:10,
                child:
                Column(
                  children: [
                    SizedBox(
                      width:250.0,
                      child: OutlinedButton(
                        onPressed: _goToCreatePetProfile,
                        child: Text('Create Pet Profile'),
                        ),
                      ),
                  Text('Note: Data will not be saved without logging in'),
                  ]
                ),
            ),

            //Space between buttons
            SizedBox(height:40),

            // Login and SignUp Button
            Expanded(
              flex:30,
              child: Container(
                width: 500.0,
                height: 50.0,
                child: Column(
                  children: [
                  SizedBox(
                    width: 250.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: _goToLogin,
                      child: Text('Login'),
                    ),
                  ),

                    //Space between buttons
                    SizedBox(height:10),

                    SizedBox(
                      width: 250.0,
                      height: 40.0,
                      child: OutlinedButton(
                        onPressed: _goToSignUp,
                        child: Text('Sign Up'),
                      ),
                    ),
                  ]
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
