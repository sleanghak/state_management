import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  // RxInt counter1 = RxInt(0);
  void increment() {
    counter++;
  }
}
