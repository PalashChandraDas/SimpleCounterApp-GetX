import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_counter/utils/custom_string.dart';

class LocalData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  setValue({required int value}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(CustomString.counterKey, value);
  }

  // getValue() async {
  //   final SharedPreferences prefs = await _prefs;
  //   var value = prefs.getInt(CustomString.counterKey) ?? 0;
  //   log('myGetValue = $value');
  // }

  clearStorage() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    log('data clear!!!!!!!!!!');
  }
}
