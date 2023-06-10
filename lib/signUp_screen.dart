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

class MySignUpScreen extends StatefulWidget
{
  const MySignUpScreen({super.key, required this.title});
  final String title;

  @override
  State<MySignUpScreen> createState() => _MySignUpScreenState();
}

class _MySignUpScreenState extends State<MySignUpScreen> {

  void _goTo() {
    Navigator.pushNamed(context, '/');

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // 'Welcome to Plan Pet'
            Expanded(
              flex:10,
              child: Text(
                'Enter Information',
                style: new TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ),

            Expanded(
              flex:90,
              child: Container(
                width: 350.0,
                child: Column(
                    children:
                    [
                      Text('Login'),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),

                      SizedBox(height:20),

                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),

                      SizedBox(height:20),

                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),

                      SizedBox(height:20),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),

                      SizedBox(height:20),

                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Re-type Password',
                        ),
                      ),

                      SizedBox(height:20),

                      Container(
                        width:150.0,
                        child: OutlinedButton(
                          onPressed: null, //toDo
                          child: Text('Submit'),
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
