import 'package:flutter/material.dart';
import 'package:p_08_firebase/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController valCodeController = TextEditingController();

  bool isWaitingForCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: TextField(
                controller: phoneController,
                decoration: kMyInputDecoration.copyWith(
                  hintText: 'Phone No.',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isWaitingForCode,
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: valCodeController,
                  decoration: kMyInputDecoration.copyWith(
                    hintText: 'Code',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(isWaitingForCode ? 'Send Code' : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }

  onButtonPressed() {
    String phone = phoneController.text;
    String code = valCodeController.text;
    // send code to phone
    if(isWaitingForCode == false){

    } // do login with the sent code
    else {
      
    }
  }
}
