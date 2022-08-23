import 'package:flutter_firebase/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<List<Product>> getAllProduct() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products/");
    final response = await http.get(allProductUrl);
    List<Product> allProducts = [];
    List body = json.decode(response.body);
    body.forEach((product) {
      allProducts.add(Product.fromJson(product));
    });
    //print(response.statusCode);
    // print(response.statusCode);
    // print(response.body);
    return allProducts;
  }

  Future getSingleProduct(int id) async {
    final singleProductUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductUrl);
    // print(response.statusCode);
    // print(response.body);
    var body = json.decode(response.body);
    return Product.fromJson(body);
  }

  Future getProductCategory() async{
    final allProductCategoryUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allProductCategoryUrl);

    //print(response.statusCode);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getProductByProductCategory(String id) async {
    final listOfProductByCategoryUrl =
        Uri.parse("https://fakestoreapi.com/products/category/$id");
    final response = await http.get(listOfProductByCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getCart(String cart) async {
    final getCartUrl = Uri.parse("https://fakestoreapi.com/carts/$cart");
    final response = await http.get(getCartUrl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future login(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http
        .post(loginUrl, body: {'username': username, 'password': password});
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future updateCart(int userId, int productId) async {
    final updateUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.put(updateUrl, body: {
      "userId": '$userId',
      "date": DateTime.now().toString(),
      "products": [
        {'productId': '$productId', 'quantity': "4"}
      ].toString()
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future deleteCart(String userId) async {
    final cartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.delete(cartUrl, body: {});
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  //AUTHENTICATING A USER 1
  Future authentitcateUser(String username, String password) async {
    final authUrl = Uri.parse("www.somewhere.io");
    final response = await http.post(authUrl, body: {'username': username, 'password': password});
    print(response.statusCode);
    print(response.body);
  }

//AUTHENTICATING A USER 2
Future userAuthentication(String username, String password)async{
    final userAuthUrl = Uri.parse('www.somewhere.io');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username: $password'))}';
    final response = await http.post(userAuthUrl,headers: {'Content-Type': 'application/json', 'authorization': basicAuth});
    print(response.statusCode);
    print(response.body);
    
}
//AUTHENTICATING A USER 3
  Future userAuthentication3(String username, String password)async{
    final userAuthUrl = Uri.parse('www.somewhere.io');
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username: $password'))}';
    final accessToken = "some access token";
    final response = await http.post(userAuthUrl,headers: {'Content-Type': 'application/json', 'authorization': 'Bearer $accessToken'});
    print(response.statusCode);
    print(response.body);

  }

}
