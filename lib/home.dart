import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentImageNumber = 0;
  Timer _timer;
  List<String> picsumImages = [
    "https://picsum.photos/id/1/200/300",
    "https://picsum.photos/id/12/201/300",
    "https://picsum.photos/id/13/202/300",
    "https://picsum.photos/id/24/203/300",
    "https://picsum.photos/id/25/204/300",
    "https://picsum.photos/id/26/205/300",
    "https://picsum.photos/id/37/206/300",
    "https://picsum.photos/id/48/207/300",
    "https://picsum.photos/id/59/208/300",
    "https://picsum.photos/id/69/209/300",
    "https://picsum.photos/id/78/206/300",
    "https://picsum.photos/id/87/207/300",
    "https://picsum.photos/id/96/208/300",
    "https://picsum.photos/id/15/200/300",
  ];

  @override
  void initState() {
    runTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 2500),
          child: Image.network(
            picsumImages[currentImageNumber],
            key: Key("${DateTime.now()}"),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width - 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  runTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      if ((currentImageNumber + 1) < picsumImages.length) {
        currentImageNumber = currentImageNumber + 1;
      } else {
        currentImageNumber = 0;
      }
      setState(() {});
    });
  }
}
