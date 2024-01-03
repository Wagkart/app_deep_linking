import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/screens/video_list.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openPopUp(context);
          },
          child: Text('Go to List Page'),
          style: ElevatedButton.styleFrom(
            elevation: 4,
            primary: Colors.lightBlue,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }
}

openPopUp(BuildContext context) {
  int itemCount = 0;
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  itemCount = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'Enter number of items',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.to(VideoList(itemCount));
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
