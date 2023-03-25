import 'package:flutter/material.dart';

class UyeOlPageView extends StatefulWidget {
  const UyeOlPageView({Key? key}) : super(key: key);

  @override
  State<UyeOlPageView> createState() => _UyeOlPageViewState();
}

class _UyeOlPageViewState extends State<UyeOlPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Üyelik Kaydı"),
      ),
    );
  }
}
