import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
   OtpScreen({super.key,required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ott Verification'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                  hintText: 'Enter OTP ',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  )
              ),
            ),
          ),
          SizedBox(height: 25,),
          ElevatedButton(onPressed: ()async{
            try{
            PhoneAuthCredential credential =
            await PhoneAuthProvider.credential(verificationId: widget.verificationid,
                smsCode: otpController.text.toString());
            FirebaseAuth.instance.signInWithCredential(credential).then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            });
            }catch(ex){
            }

          },
              child: Text('Confirm OTT'))
        ],
      ),
    );
  }
}
