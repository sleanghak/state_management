import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/controllers/product_controller.dart';

class CreateProductScreen extends StatelessWidget {
  CreateProductScreen({super.key});

  final productID = TextEditingController();
  final productName = TextEditingController();
  final productPrice = TextEditingController();
  final productDesc = TextEditingController();
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Student'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: productID,
                  decoration: InputDecoration(
                      labelText: 'ProductID',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: productName,
                  decoration: InputDecoration(
                      labelText: 'ProductName',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: productPrice,
                  decoration: InputDecoration(
                      labelText: 'ProductPrice',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  controller: productDesc,
                  decoration: InputDecoration(
                      labelText: 'ProductDesc',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      controller.createProduct(
                        productID: productID.text,
                        productName: productName.text,
                        productPrice: productPrice.text,
                        productDesc: productDesc.text,
                      );
                      // productID.clear();
                      // productName.clear();
                      // productPrice.clear();
                      // productDesc.clear();
                    },
                    child: const Text('SAVE'),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
