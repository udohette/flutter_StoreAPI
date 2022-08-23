import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/apiServices.dart';
import 'package:flutter_firebase/models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: FutureBuilder(
          future: APIService().getCart('1'),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {


              List products = snapShot.data['products'];
              return ListView.builder(
                itemCount: products.length,
                  itemBuilder: (context, index){
                  return FutureBuilder(
                    future: APIService().getSingleProduct(products[index]['productId']),
                      builder: (context, AsyncSnapshot asyncSnapShot){
                      if(asyncSnapShot.hasData){
                        Product product = asyncSnapShot.data;
                        return ListTile(
                          title: Text(product.title),
                          leading: Image.network(product.image,height: 40,),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             // Text("Price ~${products[index]['rating'].toString()}"),
                              Text("Quantity ~${products[index]['quantity']}"),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(onPressed: (){}, child: Text('Order', style: TextStyle(fontSize: 12, color: Colors.green),)),
                            //IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.green,)),
                            IconButton(onPressed: ()async{
                              APIService().deleteCart('1');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Deleted Successfully"), backgroundColor: Colors.red,));

                            }, icon: Icon(Icons.delete, color: Colors.red,)),
                          ],),
                        );
                      }else{
                        return LinearProgressIndicator();
                      }
                  });

                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar:  Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(color: Colors.white, width: 4),
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                shadowColor: Colors.blueAccent),

            onPressed: (){}, child: Text('Order All'),
          )
        ],),
      ),
      
    );
  }
}
