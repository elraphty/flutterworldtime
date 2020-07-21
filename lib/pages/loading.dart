import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos');
    await instance.getTime();
    print(instance.time);

    setState(() {
      time = instance.time;
      Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {
            'location': instance.location,
            'flag': instance.flag,
            'time': instance.time
          }
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ))
    );
  }
}
