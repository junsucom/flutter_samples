import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_samples/models/User.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchPost() async {
  final response =
  await http.get(Uri.https('jsonplaceholder.typicode.com', '/users/'));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    Iterable l = json.decode(response.body);
    return List<User>.from(l.map((model)=> User.fromJson(model)));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}


class FutureBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FutureBuilderScreen'),),
        body: FutureBuilder<List<User>>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Text("${snapshot.data[index].name}");
                  });
            } else if (snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
