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

class MyLoginScreen extends StatefulWidget
{
  const MyLoginScreen({super.key, required this.title});
  final String title;

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen>
{
  void _goTo()
  {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
     ),

      body: Center(
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Icon Image
            Expanded(
              flex:40,
              child: Container(
                width:250,
                height:250,
                child: Image( //toDo
                image: NetworkImage('https://media.istockphoto.com/id/1132462309/vector/paw-logo-of-cat-or-dog-animal-pet-vector-paw-footprint-in-circle-icon.jpg?s=612x612&w=0&k=20&c=Yx76xI62IuvrMwuC048Dq1ZiJEUuMnTjI-I90hd2pbw=')
                ),
              ),
            ),

            //'Enter Login Info'
            Expanded(
              flex:20,
              child:
                  Text('Enter Login Info',
                  style: new TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
              ),

            //Login Info Buttons - Email, Password, Forgot Password, Submit
            Expanded(
              flex:40,
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
                          labelText: 'Email',
                        ),
                      ),

                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      TextButton(
                        onPressed: null, //toDo
                        child: Text('Forgot Password?'),
                      ),

                      Container(
                        width:150.0,
                        child:OutlinedButton(
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
