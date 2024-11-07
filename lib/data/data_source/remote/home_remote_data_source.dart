import 'dart:convert';

import 'package:sample/core/config/config.dart';
import 'package:sample/data/models/home_model.dart';
import 'package:http/http.dart' as http;
abstract interface class HomeRemoteDataSource {
  Future<List<HomeModel>> fetchProduct();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
 final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});
 
  @override
  Future<List<HomeModel>> fetchProduct()async {
   try {
     var res =await client.get(Uri.parse(Config.productUrl), headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        },);
     if (res.statusCode == 200) {
       List<dynamic> body = jsonDecode(res.body);return body.map((json) => HomeModel.fromJson(json)).toList();

     }else{
      throw Exception(res.statusCode);
     }
   } catch (e) {
     throw Exception(e.toString());
   }
  }
  
}