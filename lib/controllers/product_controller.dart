import 'package:get/get.dart';
import 'package:state_management/models/product_res_model.dart';
import 'package:state_management/services/api_product.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductResModel>> {
  final api = API();
  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  void getAllProduct() async {
    final response = await api.getAllProduct();
    response.fold((l) {
      Get.snackbar(
        "Message",
        l.toString(),
      );
      change(null, status: RxStatus.error(l.toString()));
    }, (r) => change(r, status: RxStatus.success()));
  }

  void createProduct(
      {required String productID,
      required String productName,
      required String productPrice,
      required String productDesc}) async {
    final req = {
      "id": productID,
      "name": productName,
      "price": productPrice,
      "desc": productDesc
    };
    final res = await api.createProduct(req);
    if (res == 'Success') {
      Get.snackbar(
        "Mesasge",
        res,
      );
      getAllProduct();
    } else {
      Get.snackbar(
        "Mesasge",
        res,
      );
    }

    // ignore: avoid_print
    print(productID);
    // ignore: avoid_print
    print(productName);
    // ignore: avoid_print
    print(productPrice);
    // ignore: avoid_print
    print(productDesc);
  }
}
