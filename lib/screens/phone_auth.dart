import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/screens/ott_screen.dart';
// void main(){
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: PhoneAuth(),));
// }
class PhoneAuth extends StatefulWidget {
   PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Auth'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phonenumberController,
              decoration: InputDecoration(
                hintText: 'Enter phone number',
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                )
              ),
            ),
          ),
          ElevatedButton(onPressed: () async{
            await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential){},
                verificationFailed: (FirebaseException e){},
                codeSent: (String verificationid, int? resendtoken){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verificationid: verificationid,)));
                },
                codeAutoRetrievalTimeout: (String verificationid){},
                phoneNumber: phonenumberController.text.toString());
          },
              child: Text('Verify Phone number'))
        ],
      ),
    );
  }
}
