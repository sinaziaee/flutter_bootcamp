import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController controller = TextEditingController();

  // String typed = '';

  String from = 'Gram';

  String to = 'Kilo Gram';

  String result = 'status: ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measure Converter'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Value',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter value...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // onChanged: (String value) {
                  //   typed = value;
                  // },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'From',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  value: from,
                  onChanged: (String newValue) {
                    setState(() {
                      from = newValue;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Gram'),
                      value: 'Gram',
                    ),
                    DropdownMenuItem(
                      child: Text('Kilo Gram'),
                      value: 'Kilo Gram',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'To',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  value: to,
                  // items: ['Gram', 'Kilo Gram'].map<DropdownMenuItem<String>>(
                  //   (String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   },
                  // ).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      to = newValue;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Gram'),
                      value: 'Gram',
                    ),
                    DropdownMenuItem(
                      child: Text('Kilo Gram'),
                      value: 'Kilo Gram',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  result,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate(){

    String typed = controller.text;

    print('value: $typed');
    print('from: $from');
    print('to: $to');
    print('result: $result');

    double value;

    if(typed.length != 0){
      value = double.parse(typed);
    }
    // typed string has zero length
    else{
      setState(() {
        result = 'please enter a value first';
      });
      return;
    }


    if(from == 'Gram' && to == 'Kilo Gram'){
      value = value / 1000;
      result = '$typed $from' + 's are $value ' + '$to' + 's';
    }
    else if(from == 'Kilo Gram' && to == 'Gram'){
      value = value * 1000;
      result = '$typed $from' + 's are $value ' + '$to' + 's';
    }
    else {
      result = '$typed $from' + 's are $typed ' + '$to' + 's';
    }

    setState(() {});

  }

}
