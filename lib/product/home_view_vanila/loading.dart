import 'package:flutter/widgets.dart';

abstract class Loading<T extends StatefulWidget> extends State<T> {
  bool isloading = false;

  void changeLoading() {
    setState(() {
      isloading = !isloading;
    });
  }
}
