import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocemon_uygulama/model/pocedx.dart';


class PokemonDetail extends StatelessWidget {


  Pokemon pokemon;
 PokemonDetail({this.pokemon});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name, textAlign: TextAlign.center,),
      ),
     body: Stack(
       children: <Widget> [
         Positioned(
           height: MediaQuery.of(context).size.height *(7/10),
           width: MediaQuery.of(context).size.width -20,
           left: 10,
           top: MediaQuery.of(context).size.height *0.2,
           child: Card(elevation: 6,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20),
           ),

           child: Column(
               mainAxisAlignment : MainAxisAlignment.spaceEvenly,
             children: < Widget>[
               SizedBox(height:60,),
               Text(pokemon.name , style: TextStyle(fontSize: 20,color: Colors.blue, fontWeight: FontWeight.bold),),
               Text("Ağırlığı:"+pokemon.height , style: TextStyle(fontSize: 20,color: Colors.blue, ),),
               Text("Uzunluğu"+pokemon.weight , style: TextStyle(fontSize: 20,color: Colors.blue, ),),
               Text("Tipi" , style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: pokemon.type.map((tip) => Chip(backgroundColor:Colors.grey,label: Text(tip))).toList(),
               ),
               Text("Zayıflığı" , style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: pokemon.weaknesses!=null?
                 pokemon.weaknesses.map((weaknesess) =>Chip (backgroundColor:Colors.grey,label:
                 Text(weaknesess, style: TextStyle(color: Colors.white),))).toList():[Text("Zayıflığı Yok")],
               )


             ] ), )
          ),




           Align(
             alignment: Alignment.topCenter,
             child: Hero(tag: pokemon.img, child: Container(
               width: 200,
               height: 200,
               child: Image.network(pokemon.img.replaceAll( "http://", "https://"),),
             )),
           )
       ],
     ),


    );

  }
}
