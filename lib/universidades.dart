import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Uni extends StatefulWidget {
  const Uni({super.key});

  @override
  UniState createState() => UniState();

}

class UniState extends State<Uni> {
  String pais = '';
  List<dynamic> universidades = [];

  Future<void> obtenerUniversidades(String pais) async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=$pais'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        universidades = data;
      });
    } else {
      setState(() {
        universidades = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades por País'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                pais = value;
              },
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre del país en inglés',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                obtenerUniversidades(pais);
              },
              child: const Text('Obtener Universidades'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: universidades.length,
                itemBuilder: (context, index) {
                  final universidad = universidades[index];
                  return ListTile(
                    title: Text(universidad['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dominio: ${universidad['domains'].join(', ')}'),
                        Text('Página web: ${universidad['web_pages'].join(', ')}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}