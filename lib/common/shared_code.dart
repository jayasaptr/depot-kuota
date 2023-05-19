import 'package:flutter/material.dart';

class SharedCode {
  final BuildContext context;
  SharedCode(this.context);

  //shared preferences constants
  static const String authJson = 'authJson';

  //Api constants
  static const String baseUrl =
      'https://api-depotkuota.tkb.co.id/api-depotkuota/';
}
