import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/utils/utils.dart';
import 'package:sample/domain/entity/home_entity.dart';
import 'package:sample/presentation/blocs/home/home_cubit.dart';
import 'package:sample/presentation/views/product/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final route = MaterialPageRoute(builder: (_)=>const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Estore"),
        leading:const Icon(Icons.menu),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return loading();
          }
          if (state is HomeLoadError){
            return error(state.error);
          }
          if (state is HomeLoaded){
            return body(context,state.products);
          }
          
          return Container();
        },
      ),
    );
  }

  Widget body(BuildContext context, List<HomeEntity> products) {
    return ListView(
      padding: EdgeInsets.all(5),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        spaceHeight(10),
      const  Text("Trending products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        spaceHeight(10),
       
        GridView.builder(
          shrinkWrap: true,
          // padding:const EdgeInsets.all(8),
          physics: const ScrollPhysics(),
          itemCount: products.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10, 
          mainAxisExtent: 300
          ), itemBuilder: (context, index) {
            var data = products[index];
            return GestureDetector(
              onTap: (){
                  navigatorKey.currentState!.push(ProductDetailScreen.route(image: "assets/download.jpg",product: data));

              },
              child: Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  boxShadow:const [
                    BoxShadow(color: Colors.black12,blurRadius: 2)
                  ],
                   color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Stack(
                      
                      children: [
                        ClipRRect(
                          borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          child: Image.asset("assets/download.jpg", 
                        height: 180,
                        width: sW(context),
                        fit: BoxFit.fill,
                        ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            
                            padding:const EdgeInsets.symmetric(horizontal: 5),
                            decoration:const BoxDecoration(
                              color: Colors.black12
                            ),
                            child: Text("${data.discount} OFF", 
                            textAlign: TextAlign.center,
                            style:const TextStyle(color: Colors.white,fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                    spaceHeight(5), 
                    Text(data.productName,style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),)
                 ,spaceHeight(5), 
                  
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    const    Icon(Icons.star,color: Colors.amber,),
                    spaceWidth(10),
                        Text(data.rating,style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                          spaceWidth(10)
                      ],
                    ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text("₹${data.price}",style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                          spaceWidth(10)
                      ],
                    ), 
                 
                  ],
                ),
              ),
            );
          },),

           spaceHeight(20),
      const  Text("New Arrivals",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        spaceHeight(10),
        SizedBox(
          height: 300,
          child: ListView.separated(
            separatorBuilder: (context, index) => spaceWidth(10),
            shrinkWrap: true,
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = products[index];
              return GestureDetector(
                onTap: (){
                  navigatorKey.currentState!.push(ProductDetailScreen.route(image: "assets/download.jpg",product: data));
                },
                child: Container(
                decoration: BoxDecoration(
                  boxShadow:const [
                    BoxShadow(color: Colors.black12,blurRadius: 2)
                  ],
                   color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          child: Image.asset("assets/download.jpg", 
                        height: 180,
                        width: 200,
                        fit: BoxFit.fill,
                        ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            
                            padding:const EdgeInsets.symmetric(horizontal: 5),
                            decoration:const BoxDecoration(
                              color: Colors.black12
                            ),
                            child: Text("${data.discount} OFF", 
                            textAlign: TextAlign.center,
                            style:const TextStyle(color: Colors.white,fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                    spaceHeight(5), 
                    Text(data.productName,style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),)
                 ,spaceHeight(5), 
                  
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    const    Icon(Icons.star,color: Colors.amber,),
                    spaceWidth(10),
                        Text(data.rating,style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                          spaceWidth(10)
                      ],
                    ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text("₹${data.price}",style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                          spaceWidth(10)
                      ],
                    ), 
                 
                  ],
                ),
                            ),
              );
            },),
        )
       ,spaceHeight(15)
      ],
    );
  }
}