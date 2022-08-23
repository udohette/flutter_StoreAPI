import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/apiServices.dart';
import 'package:flutter_firebase/models/product.dart';

import 'listProductByCategory.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Product Category'),),
        body: FutureBuilder(
            future: APIService().getProductCategory(),
            builder: (context, AsyncSnapshot snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ListProductByCategory(snapShot.data[index])));
                        },
                        child: Card(
                          
                          elevation: 2,
                          margin: EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: EdgeInsets.all(50),
                            child: Center(
                              child: Chip(label:
                              Text(snapShot.data[index].toString().toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 15),),backgroundColor: Colors.blueAccent),
                            ),
                          ),
                        ),
                      );
                    }


                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            })
    );
  }
}
