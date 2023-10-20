import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';
import 'package:state_management/models/product_res_model.dart';

class API {
  Future<Either<String, List<ProductResModel>>> getAllProduct() async {
    try {
      final response = await Dio().get('http://localhost:3000/products');
      if (response.statusCode == 200) {
        final List<ProductResModel> products = [];
        for (var item in response.data) {
          products.add(ProductResModel.fromJson(item));
        }
        return Right(products);
      } else {
        return const Left('Something went wrong');
      }
    } catch (e) {
      return Left(e.toString());
      // ignore: dead_code, avoid_print
      print('Error: $e');
    }
  }

  Future<String> createProduct(Map<String, Object> req) async {
    String mess = "";
    try {
      final response = await Dio().post('http://localhost:3000/products');
      if (response.statusCode == 200) {
        mess = "success";
        // ignore: avoid_print
        print(mess);
        return mess;
      } else {
        mess = 'Something went wrong';
        // ignore: avoid_print
        print(mess);
        return mess;
      }
    } catch (e) {
      return 'Something went wrong: $e';
      // ignore: dead_code
      return e.toString();
    }
  }
}
