import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared extends StatefulWidget {
  const MyShared({super.key});
  @override
  State<MyShared> createState() {
    return _MySharedState();
  }
}

class _MySharedState extends State<MyShared> {
  late SharedPreferences preft;
  final TextEditingController _datapenting = TextEditingController();
  String isidata = "";

  @override
  void dispose() {
    _datapenting.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences")),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _datapenting,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () {
                saveData();
              },
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: isidata,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Get Value"),
              onPressed: () {
                readData();
              },
            ),
            ElevatedButton(
              child: const Text("Delete Value"),
              onPressed: () {
                deleteData();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveData() async {
    preft = await SharedPreferences.getInstance();
    preft.setString("tekscontoh", _datapenting.text);
    _datapenting.clear();
  }

  Future<void> readData() async {
    preft = await SharedPreferences.getInstance();
    setState(() {
      isidata = preft.getString("tekscontoh").toString();
    });
  }

  Future<void> deleteData() async {
    preft = await SharedPreferences.getInstance();
    preft.remove("tekscontoh");
    setState(() {
      isidata = "";
    });
  }
}
