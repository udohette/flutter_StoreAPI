
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/product.dart';
import 'package:flutter_firebase/screens/productCategory.dart';
import 'package:flutter_firebase/screens/productDetailScreen.dart';

import '../Services/apiServices.dart';
import 'cartScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductCategory()));
          }, icon: Icon(Icons.view_list)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: FutureBuilder(
          future: APIService().getAllProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return  Center(child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    Product product = snapshot.data[index];
                    return ListTile(
                      title: Text(product.title),
                      leading: Image.network(product.image, height: 50, width: 30,),
                      subtitle: Text("price - \$${product.price.toString()}"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product.id)));
                      },
                    );

                  }),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}
