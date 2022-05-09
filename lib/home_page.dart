// ignore_for_file: prefer_const_constructors

import 'package:city_guide/carro.dart';
import 'package:city_guide/drawer_list.dart';
import 'package:city_guide/utils/carros_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontFamily: 'georgia',
          fontSize: 27,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        title: Text('Guia Carros'),
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return ListView.builder(
      itemCount: carros.length,
      itemBuilder: (context, index) {
        Carro c = carros[index];

        return Row(
          children: [
            Image.network(
              c.urlFoto,
              width: 150,
            ),
            Flexible(
              child: Text(
                c.nome,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        );
      },
    );
  }
}
