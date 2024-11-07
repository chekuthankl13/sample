import 'package:sample/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required super.productId, required super.productName, required super.description, required super.price, required super.unit, required super.image, required super.discount, required super.availability, required super.brand, required super.category, required super.rating});
  

factory HomeModel.fromJson(Map<String,dynamic>json)=>HomeModel(
  productId: json['product_id'].toString(),
   productName: json['name'].toString(),
    description: json['description'].toString(),
     price: json['price'].toString(),
      unit: json['unit'],
       image: json['image'].toString(),
        discount: json['discount'].toString(),
         availability: json['availability'], brand: json['brand'].toString(),
          category: json['category'], rating: json['rating'].toString());



factory HomeModel.froomEntity(HomeEntity data)=> HomeModel(productId:data.productId, productName:data.productName, description:data.description, price:data.price,
 unit:data.unit, image:data.image,
  discount:data.discount, availability:data.availability,
   brand:data.brand, category:data.category, rating:data.rating);

}

// "product_id": 1,
//     "name": "Smartphone",
//     "description": "High-end smartphone with advanced features.",
//     "price": 599.99,
//     "unit": "Piece",
//     "image": "https://example.com/images/smartphone.jpg",
//     "discount": 10,
//     "availability": true,
//     "brand": "BrandX",
//     "category": "Electronics",
//     "rating": 4.5,