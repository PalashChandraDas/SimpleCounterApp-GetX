import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_counter/controllers/counter_screen_controller.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  final CounterScreenController _controller = Get.put(CounterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: _myBody(),
    );
  }

  //CUSTOM_METHOD_HERE.....
  _myAppBar() {
    return AppBar(
      title: const Center(child: Text('Simple Counter')),
    );
  }

  _myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => GradientText(
            '${_controller.myCounter}',
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold,),
            colors: const [Colors.pink, Colors.yellow],
          )
          ),
          Container(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => _controller.decrement(),
                backgroundColor: Colors.pink,
                child: const Icon(Icons.remove),),
              Container(width: 20,),
              FloatingActionButton(
                onPressed: () => _controller.myReset(),
                backgroundColor: Colors.pink,
                child: const Icon(Icons.refresh),),
              Container(width: 20,),
              FloatingActionButton(
                onPressed: () => _controller.increment(),
                backgroundColor: Colors.pink,
                child: const Icon(Icons.add),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
