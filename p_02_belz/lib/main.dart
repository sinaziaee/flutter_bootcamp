import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Size size;
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              makeBelzItem(Colors.red, 1),
              makeBelzItem(Colors.orange, 2),
              makeBelzItem(Colors.yellow, 3),
              makeBelzItem(Colors.green, 4),
              makeBelzItem(Colors.blue, 5),
              makeBelzItem(Colors.blueGrey, 6),
              makeBelzItem(Colors.black, 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeBelzItem(Color color, int num) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: (){
          playSound(num);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: size.height - size.height * 0.08 * num,
          width: size.width * 0.14,
        ),
      ),
    );
  }
  
  void playSound(int number){
    player.setAsset('assets/belz-audios/audio$number.wav');
    player.play();
  }
  
}
