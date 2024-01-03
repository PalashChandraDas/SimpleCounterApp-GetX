import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_counter/localData/local_data.dart';
import 'package:simple_counter/utils/custom_string.dart';

class CounterScreenController extends GetxController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var myCounter = 0.obs;

  @override
  void onInit() {
    loadExistCounterValue(); // save all value
    super.onInit();
  }

  // save all value
  void loadExistCounterValue() async {
    final SharedPreferences prefs = await _prefs;
    myCounter.value = (prefs.getInt(CustomString.counterKey) ?? 0);
    log('counter loaded successfully : $myCounter');
  }

  void increment() async {
    final SharedPreferences prefs = await _prefs;
    myCounter.value = ((prefs.getInt(CustomString.counterKey) ?? 0) + 1);
    LocalData().setValue(value: myCounter.value);

    log('**value = $myCounter');
  }
  void decrement() async {

    // myCounter > 0 ? myCounter.value-- : Fluttertoast.showToast(msg: 'Already Zero');
    if(myCounter.value > 0) {
      final SharedPreferences prefs = await _prefs;
      myCounter.value = ((prefs.getInt(CustomString.counterKey) ?? 0) - 1);
      prefs.setInt(CustomString.counterKey, myCounter.value);

      log('**value = $myCounter');
    } else{
      Fluttertoast.showToast(msg: 'Already Zero');
    }

  }
  void myReset(){
    // myCounter > 0 ? myCounter.value = 0 : Fluttertoast.showToast(msg: 'Already Reset');
    if(myCounter > 0){
      myCounter.value = 0;
      LocalData().clearStorage();
    } else{
      Fluttertoast.showToast(msg: 'Already Reset');
    }

  }
}