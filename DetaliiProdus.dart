import 'package:flutter/material.dart';
import 'HomePage.dart';
dynamic _items=GetFileJson();
class Lastwin extends StatefulWidget {
  int id;
  bool check=true;
  Lastwin(this.id);
  @override
  State<Lastwin> createState() => _LastwinState();
}
class _LastwinState extends State<Lastwin> {
  Widget textComplet(){
  return Text(_items[this.widget.id]['Descriere2']);
  }
  Widget TextPartial(){
    return SizedBox(
      height: 100,
      child: Container(
        alignment: Alignment.topLeft,
        child:Text(_items[this.widget.id]['Descriere2']),
      ),
    );
  }
  void apasat(){
    setState(() {
      if(this.widget.check==true)
        this.widget.check=false;
      else
        this.widget.check=true;
    });
  }
  Widget Detalii(){
    return Column(
      children:<Widget>[
        //Img
        Center(
          child:Image.asset(_items[this.widget.id]['images_path'],width:400 ,fit: BoxFit.fitWidth,),
        ),
        //SizeColor Details
        Container(margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child:Column(
            children:<Widget> [
              //----Denumire----
              Container(
                alignment: Alignment.topLeft,
                child:Text( _items[this.widget.id]['Nume'],
                  style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
                ),
              ),
              //----ColorSize----
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Stack(
                  children:<Widget> [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child:Container(
                        margin: EdgeInsets.all(10),
                        child:Stack(
                          children: <Widget> [
                            Text("Size:"),
                            Container(
                              alignment: Alignment.topRight,
                              child:Text(_items[this.widget.id]['Numes'].toString(), style: TextStyle(fontWeight: FontWeight.bold,), ),),
                          ],
                        ),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.fromLTRB(200, 0, 0, 0),
                      child:Container(
                        margin: EdgeInsets.all(10),
                        child:Stack(
                          children: <Widget> [
                            Text("Color:"),
                            Container(
                              alignment: Alignment.topRight,
                              child:Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ), ),
                          ],
                        ),),
                    ),
                  ] ,
                ),
              ),
              //----Detaile----
              Container(
                alignment: Alignment.topLeft,
                child:Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Details",style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize:25, ),),
                ),
              ),
              //----Corpul Details---
              Container(
                margin: EdgeInsets.fromLTRB(0, 20,0, 0),
              child:Column(children:<Widget>[
                this.widget.check ? TextPartial() : textComplet(),
                Container(
                  alignment: Alignment.topLeft,
                child:TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    apasat();
                  },
                  child:const Text('Read More',style:TextStyle(color: Colors.green,),),
                ),
                ),
              ],),),
              Container(
                alignment: Alignment.topLeft,
                child:Text("Reviews",style: TextStyle(fontWeight: FontWeight.bold,fontSize:25, ),),
              ),
              Container(
                alignment: Alignment.topLeft,
                child:TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: (){},
                  child: Text("Write you",style: TextStyle(color: Colors.green,),),
                ),
              ),

            ],
          ),
        ),
        //Details

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Detalii();
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Text("");
            },
            childCount: 1,
          ),
        ),
      ],),
    );
  }
}


