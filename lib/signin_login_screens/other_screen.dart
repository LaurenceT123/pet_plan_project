import 'package:flutter/material.dart';
import '../main.dart';

void main() => runApp(MyOther_screen(title: 'test'));

class MyOther_screen extends StatefulWidget
{
  const MyOther_screen({super.key, required this.title});
  final String title;

  @override
  State<MyOther_screen> createState() => _OtherState();
}

class _OtherState extends State<MyOther_screen> {

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
                  background: Image.network('https://t3.ftcdn.net/jpg/01/19/67/02/360_F_119670247_HDccziQUuo2kFpaNiM22dIto5I8GPAWW.jpg', fit: BoxFit.cover),
                ),
              ),
            ];
          },


          body:Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Expanded(
                    flex: 30,
                    child: Column( children: <Widget> [

                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Sorry, it seems we don\'t have the animal of your choice listed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:20,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child:Text('Please enter what animal you are planning for',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:20,
                          ),
                        ),
                      ),

                    ]
                    ),
                  ),
                  Expanded(
                    flex:40,
                    child: Container(
                      width: 350.0,
                      child: Column(
                          children:
                          [
                            TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),

                          ]
                      ),
                    ),
                  ),

                ]
            ),
          ),
        )
    );
  }
}
