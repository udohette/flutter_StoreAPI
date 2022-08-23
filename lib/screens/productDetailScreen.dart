import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/apiServices.dart';
import 'package:flutter_firebase/models/product.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  ProductDetails(this.id);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body:
      FutureBuilder(
          future: APIService().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {
              Product product = snapShot.data;


                    return Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListView(children: [
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [

                            Center(child:
                            Text('Product Decsription', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.teal,),),),
                            SizedBox(height: 30,),
                            Image.network(product.image),
                            Text("Description: \n"+product.description, style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 30,),
                            Text(
                                "Price ~ \$" + product.price.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Rating ~ " +
                                product.rating.rate.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Count ~ " +
                                product.rating.count.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            Chip(label:
                            Text(product.category.name, style: TextStyle(color: Colors.white, fontSize: 15),),backgroundColor: Colors.blueAccent),
                          ],
                        ),
                      ],)
                    );

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
          backgroundColor: Colors.teal,
          onPressed: ()async{
          APIService().updateCart(1, id);
          Future.delayed(Duration(seconds: 3));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added Successfully"), backgroundColor: Colors.green,));

      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
