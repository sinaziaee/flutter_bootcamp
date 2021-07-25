import 'package:flutter/material.dart';

// https://licotab.ir/home/img/licotab.png

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blueGrey[200],
        child: const Center(
          child: FadeInImage(
            image: NetworkImage('https://licotab.ir/home/img/licotab.png'),
            placeholder: AssetImage('assets/licotab1.png'),
          ),
        ),
      ),
    ),
  );
}
