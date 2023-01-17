// TODO Implement this library.
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
List _items = [];
Future<List> readJson() async {
  final String response = await rootBundle.loadString('assets/first.json');
  final data = await json.decode(response);
  _items = data["items"];
  return _items;
}