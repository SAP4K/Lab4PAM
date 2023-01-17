// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'DetaliiProdus.dart';
import 'Header.dart';

dynamic _items = null;
Future<dynamic> readJson() async {
  if(_items==null) {
    final String response = await rootBundle.loadString('assets/first.json');
    final data = await json.decode(response);
    _items = data["items"];
  }
return _items;
}
dynamic GetFileJson(){
  return _items;
}
class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}
class _HomePState extends State<HomeP> {
 void apasata(){
   setState(() {
     print("apasat");
   });
 }
  Widget Elements(){
    return Stack(
      children: <Widget> [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Text("Best Selling",style: TextStyle(fontWeight:  FontWeight.bold,fontSize: 17), ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
          child:TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              padding: EdgeInsets.only(top:20,right: 10,),
            ),
            onPressed: (){
              apasata();
            },
            child:Text("See All",),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10,10),
            child:GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 330,
              ),
              itemCount: _items.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child:Stack( children: <Widget>[
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            int q=_items[index]['id'];
                            return Lastwin(q);
                          }),
                          );
                        },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            child:Stack(children: <Widget>[
                            Image.asset(_items[index]['images_path'],), ],
                          ),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                          child:Text(_items[index]['Nume'],style: TextStyle(fontWeight:  FontWeight.bold,fontSize: 15),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                          child:Text(_items[index]['description'],style: TextStyle(color:Colors.black.withOpacity(0.5),fontSize: 15),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                          child:Text("\$${_items[index]['Pret']}",style: TextStyle(color:Colors.green,fontSize: 20),),
                        ),
                      ],
                    ),
                    Positioned(
                      left:150,
                      top:15,
                      child: Icon(
                        Icons.star_border,
                        size: 20.0,
                      ),),
                  ],
                  ),
                );
              },
            )
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize:  Size.fromHeight(130.0),
        child: headerul(),
      ),
      body: FutureBuilder(
        future:readJson(),
        builder: (conteaxt,snapshot){
          if(snapshot.hasData){
            return Elements();
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
