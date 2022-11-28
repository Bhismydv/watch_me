
import 'package:flutter/material.dart';
import 'package:watch_me/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {

   data =data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
   print(data);

   //background
   Color? blueColor= Colors.blue[300];
   Color? blackColor= Colors.grey[700];
   String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
   Color? bgColor = data['isDayTime'] ? blueColor : blackColor;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/$bgImage'),
                  fit : BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
              child: Column(

                children: [
                  FlatButton.icon(onPressed: ()async{
                      dynamic result= await Navigator.pushNamed(context, '/pick_location');
                      setState(() {
                        data = {
                          'location' : result['location'],
                          'flag' : result['flag'],
                          'time' : result['time'],
                          'isDayTime' : result['isDayTime'],
                        };
                      });
                  },
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[200],
                      size: 30.0,),
                      label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300]
                      ),)
                  ),SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.grey[300],
                          letterSpacing: 2.0
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.grey[300],
                        letterSpacing: 2.0
                    ),
                  )
                ],
              ),
            ),
          )
      ),
          );
  }
}
