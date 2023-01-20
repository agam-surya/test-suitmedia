import 'package:flutter/material.dart';
import 'package:test1/api.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  // bool _isLoading = true;
  // bool _hasMore = true;
  int currentpage = 1;
  int totalPage = 0;
  int countItem = 0;

  ScrollController _sc = ScrollController();
  bool isLoading = false;
  final List<Datum?> _datas = [];

  @override
  void initState() {
    super.initState();
    getApi(currentpage);
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        getApi(currentpage);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_datas.length < countItem && currentpage <= totalPage) {
      getApi(currentpage);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff2B637B)),
        elevation: 0,
        title: const Text(
          "Third Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            controller: _sc,
            itemCount: _datas.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == _datas.length) {
                return const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 24,
                    width: 24,
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context,
                        _datas[index]!.firstName.toString() +
                            " " +
                            _datas[index]!.lastName.toString());
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(_datas[index]!.avatar.toString()),
                    ),
                    title: Text(_datas[index]!.firstName.toString() +
                        " " +
                        _datas[index]!.lastName.toString()),
                    subtitle: Text(_datas[index]!.email.toString()),
                  ),
                );
              }
            },
          )),
    );
  }

  void getApi(int page) async {
    List<Datum?> data = [];
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=${page}"));

      final user = Users.fromJson(jsonDecode(response.body));
      for (int i = 0; i < user.data.length; i++) {
        data.add(user.data[i]);
      }
      setState(() {
        countItem = user.total;
        totalPage = user.totalPages;
        isLoading = false;
        _datas.addAll(data);
        currentpage++;
      });
    }
  }
}
