import 'package:flutter/material.dart';
import 'package:test1/thirdScreen.dart';
import 'package:test1/widgets.dart';

class SecondScreen extends StatefulWidget {
  String name;
  SecondScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState(name: name);
}

class _SecondScreenState extends State<SecondScreen> {
  String name;
  _SecondScreenState({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff2B637B)),
        elevation: 0,
        title: const Text(
          "Second Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome"),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Center(
                child: Text(
              "Selected User Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            customButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreen(),
                      ));

                  setState(() {
                    name = result;
                  });
                },
                text: "Choose a User")
          ],
        ),
      ),
    );
  }
}
