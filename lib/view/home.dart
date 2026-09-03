// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:product_store/product.dart';
import 'package:product_store/productmodel.dart';
import 'package:product_store/shopping.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List <Product> products = [
    Product(img: "assets/Laptop.webp", name: "Laptop", price: 1000.0),
    Product(img: "assets/phone.jpeg", name: "phone", price: 500.0),
    Product(img: "assets/headphone.jpeg", name: "Headphone", price: 200.0),
  ];

  @override
  
  Widget build(BuildContext context) {
    final product = Provider.of<Productmodel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Products",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              color: Colors.transparent,
              child: Consumer<Productmodel>(
                builder: (BuildContext context, Productmodel value, Widget? child){ 
                  return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => Shopping(),));
                  },
                  child: Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 30,)
                  );
                }, 
              ),
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 2,
        mainAxisSpacing: 5,
        children: [
          for(int i = 0; i < products.length;i++)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            width: 90,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 2
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(products[i].img,width: 90,height: 70,),
                SizedBox(height: 5,),
                Text(products[i].name,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
                SizedBox(height: 5,),
                Text("\$${products[i].price}",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15
                ),),
                SizedBox(height: 5,),
                InkWell(
                  onTap: () {
                    product.addToCart(products[i]);
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Add to Cart",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}