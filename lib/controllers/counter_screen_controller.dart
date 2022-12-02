import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CounterScreenController extends GetxController{
  var myCounter = 0.obs;

  @override
  void onInit() {
    increment();
    decrement();
    myReset();

    super.onInit();
  }

  void increment(){
    myCounter.value++;
  }
  void decrement(){

    myCounter > 0 ? myCounter.value-- : Fluttertoast.showToast(msg: 'Already Zero');
  }
  void myReset(){
    myCounter > 0 ? myCounter.value = 0 : Fluttertoast.showToast(msg: 'Already Reset');

  }
}