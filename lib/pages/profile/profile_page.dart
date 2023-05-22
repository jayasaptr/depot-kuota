import 'package:depotkuota/pages/home/widget/header_home.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const HeaderHome(),
          const SizedBox(height: 10),
          Container(),
        ],
      ),
    ));
  }
}
