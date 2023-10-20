import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/controllers/product_controller.dart';

class ProductScreen extends GetView<ProductController> {
  ProductScreen({super.key});
  @override
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state[index].name.toString()),
              subtitle: Text(state[index].price.toString()),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
