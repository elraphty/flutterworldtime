import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'assets/day.png' : 'assets/night.png';
    print(bgImage);


    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              bgImage
            ),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.edit_location),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 28.0
                      )
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0
                )
              )
            ],
          ),
        ),
      )),
    );
  }
}
