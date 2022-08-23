import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/apiServices.dart';
import 'package:flutter_firebase/screens/productDetailScreen.dart';

class ListProductByCategory extends StatelessWidget {
   String id;
   ListProductByCategory(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(id.toUpperCase()),),
      body: FutureBuilder(
        future: APIService().getProductByProductCategory(id),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return  Center(child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data[index]['title']),
                      leading: Image.network(snapshot.data[index]['image'], height: 50, width: 30,),
                      subtitle: Text("price - \$${snapshot.data[index]['price']
                      }"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(snapshot.data[index]['id'])));
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
