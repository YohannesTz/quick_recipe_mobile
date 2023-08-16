import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("GeeksforGeeks"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/Instagram.png')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number, email or username',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: const Text( 'Log in ', style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: (){
                    print('Successfully log in ');
                  },

                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 62),
                    child: Text('Forgot your login details? '),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:1.0),
                    child: InkWell(
                        onTap: (){
                          if (kDebugMode) {
                            print('hello');
                          }
                        },
                        child: const Text('Get help logging in.', style: TextStyle(fontSize: 14, color: Colors.blue),)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
