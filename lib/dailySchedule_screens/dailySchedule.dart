import 'package:flutter/material.dart';
import '../main.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyDailySchedule_screen(title: 'test'));
}
class MyDailySchedule_screen extends StatefulWidget
{
  const MyDailySchedule_screen({super.key, required this.title});
  final String title;

  @override
  State<MyDailySchedule_screen> createState() => _DailyScheduleState();
}

class _DailyScheduleState extends State<MyDailySchedule_screen> {

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

    return Scaffold(
      appBar: AppBar(
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: (){},
          ),
        ]
      ),

      body: Center(
        child:Column(
            children: [


            ]
        ),

      ),
    );
  }
}
