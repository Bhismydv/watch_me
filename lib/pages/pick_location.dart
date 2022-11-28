import 'package:flutter/material.dart';
import '../services/world_time.dart';
class Pick_Location extends StatefulWidget {
  const Pick_Location({Key? key}) : super(key: key);

  @override
  _Pick_LocationState createState() => _Pick_LocationState();
}

class _Pick_LocationState extends State<Pick_Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDayTime: false),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', isDayTime: false),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDayTime: false),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDayTime: false),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDayTime: false),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDayTime: false),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDayTime: false),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDayTime: false),
    WorldTime(url: 'Asia/Dhaka', location: "Dhaka", flag: 'ban.png', isDayTime: false),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'ind.png', isDayTime: false),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo',  flag: 'japan.png', isDayTime: false),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'aus.png', isDayTime: false),
  ];


  void upDateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigaate to home screen
    Navigator.pop(context, {'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }


  @override
  Widget build(BuildContext context) {
    /*print('build Function run');*/
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'Pick a Location',),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder( itemCount: locations.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
          child: Card(
            child: ListTile(
              onTap: (){
                upDateTime(index);
                /*print(locations[index].location);*/
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
      },),
    );
  }
}
