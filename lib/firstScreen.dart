import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test1/widgets.dart';

import 'secondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController? nameC = TextEditingController();
  TextEditingController? palC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/add.png"),
              radius: 50,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
                controller: nameC,
                decoration: InputDecoration(
                  hintText: "Name",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: palC,
              decoration: InputDecoration(
                hintText: "Palindrome",
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            customButton(
                onPressed: () {
                  checkPalindrome(text: palC!.text, context: context);
                },
                text: "CHECK"),
            const SizedBox(
              height: 20,
            ),
            customButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          name: nameC!.text,
                        ),
                      ));
                },
                text: "NEXT"),
          ],
        ),
      ),
    );
  }
}

checkPalindrome({required String text, required BuildContext context}) {
  String? reverse = text.split('').reversed.join('');
  if (text == reverse) {
    return showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              content: Text('Its A Palindrome'),
            ));
  } else {
    return showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              content: Text('Not Palindrome'),
            ));
  }
}
