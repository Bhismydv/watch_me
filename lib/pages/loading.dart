import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
  WorldTime instance= WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', isDayTime: false);
 await instance.getTime();

 Navigator.pushReplacementNamed(context, '/home', arguments:{
   'location': instance.location, 'flag': instance.flag, 'time': instance.time, 'isDayTime': instance.isDayTime
 });

}
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.grey,
          size: 80.0,
        ),
      )
    );
  }
}
