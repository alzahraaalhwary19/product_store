// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:product_store/productmodel.dart';
import 'package:provider/provider.dart';

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Productmodel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,size: 26,)),
          title: Center(child: Text("Cart",style: TextStyle(
            color: Colors.white,
          ),),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: product.product.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
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
                  child: Row(
                    children: [
                      Image.asset(product.product[index].img,width: 100,height: 60,),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.product[index].name),
                          SizedBox(width: 5,),
                          Text("\$${product.product[index].price}"),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          product.removeFromCart(product.product[index]);
                        }, 
                        icon: Icon(Icons.remove_circle,color: Colors.red,)
                      )
                    ],
                  ),
                );
              },
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            child: Row(
              children: [
                Text("Total: \$${product.total}",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                Spacer(),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Checkout",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}