import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pocemon_uygulama/model/pocedx.dart';
import 'package:pocemon_uygulama/pokemon_details.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";  //Json formatında pokemonları tutan bir veri seti kullanıldı githuptan.
  Pokedex pokedex;
  Future<Pokedex> veri;

  Map<String, dynamic> get decodedJson => null;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri= pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: FutureBuilder<Pokedex>(
        future: veri,
        builder: (context, gelenPokedex) {
          if (!gelenPokedex.hasData) return CircularProgressIndicator();

          return GridView.count(
            crossAxisCount: 2,
            children: gelenPokedex.data.pokemon.map((poke) {
              print(poke.img);
              return InkWell(
                onTap: (  ){ 
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonDetail(pokemon: poke,)));
                 
                },
                child: Hero(
                  tag: poke.img,
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Image.network(poke.img.replaceAll("http://", "https://")),
                          ),
                        ),
                        Text(
                          poke.name,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
