import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Genero extends StatefulWidget {
  const Genero({super.key});

  @override
  GeneroState createState() => GeneroState();
}

class GeneroState extends State<Genero> {
  String nombre = '';
  String genero = '';

  //Uso del api: (https://api.genderize.io/?name=irma)
  Future<void> obtenerGenero(String nombre) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$nombre'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Obtener el género de la respuesta
      setState(() {
        genero = data['gender'] ?? ''; 
      });
    } else {
      // Limpiar el género si hay un error en la solicitud
      setState(() {
        genero = '';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinar genero'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
            'Ingrese un nombre para determinar el género:',
            style: TextStyle(fontSize: 16),
            ),
            TextField(
              onChanged: (value) {
                nombre = value;
              },
              decoration: const InputDecoration(
                hintText: 'Ingrese un nombre',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                obtenerGenero(nombre);
              },
              child: const Text('Obtener Género'),
            ),
            const SizedBox(height: 20),
            genero.isNotEmpty
                ? genero.toLowerCase() == 'male'
                    ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.pink,
                      )
                  // Mostrar un contenedor azul o rosa dependiendo del género
                : Container(), 
          ],
        )
      )
    );
  }

}