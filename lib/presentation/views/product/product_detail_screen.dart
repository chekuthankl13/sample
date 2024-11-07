import 'package:flutter/material.dart';
import 'package:sample/core/utils/utils.dart';
import 'package:sample/domain/entity/home_entity.dart';

class ProductDetailScreen extends StatefulWidget {
  final HomeEntity product;
  final String image;
  const ProductDetailScreen({super.key, required this.product, required this.image});
  static  route({product,image}) => MaterialPageRoute(builder: (_)=> ProductDetailScreen(image: image,product: product,));

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    var image = widget.image;
    return Scaffold(
      appBar: AppBar(title:const Text("Product Detail"),),
      body: ListView(
        padding:const EdgeInsets.all(8),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Image.asset(image,height: 500,fit: BoxFit.cover,),
              product.availability? Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: sW(context),
                  color: Colors.black12.withOpacity(.3),
                  child:const Text("Not Available"),
                ),
              ) : const SizedBox()
            ],
          ), 
          spaceHeight(10), 
          txt(product.productName),
          spaceHeight(10), 
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  txt("category : "),
                  txt(product.category,isSmall: true),
                ],
              ), 
               Row(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    const    Icon(Icons.star,color: Colors.amber,),
                    spaceWidth(10),
                        Text(product.rating,style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                          spaceWidth(10)
                      ],
                    ),
            ],
          ), 
          spaceHeight(10),
           Row(
             children: [
               Text("₹${product.price}",style:const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400),),
                              spaceWidth(10),
                              Text(product.unit)
             ],
           ),
          spaceHeight(10),
Text(product.description),
spaceHeight(10), 


        ],
      ),
    );
  }

  Text txt(txt, {isSmall = false}) => Text(txt,style: TextStyle(fontSize:isSmall?15: 20),);
}