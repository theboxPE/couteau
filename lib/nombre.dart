import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Nombre extends StatefulWidget {
  const Nombre({super.key});

  @override
  NombreState createState() => NombreState();
}

class NombreState extends State<Nombre> {
  String nombre = '';
  int? edad;
  String mensaje = '';

  //consumo del api:  (https://api.agify.io/?name=meelad)
  Future<void> obtenerEdad(String nombre) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$nombre'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        edad = data['age'] as int?;
        // Determinar el mensaje según la edad obtenida
        if (edad != null) {
          if (edad! <= 30) {
            mensaje = 'Joven';
          } else if (edad! <= 60) {
            mensaje = 'Adulto';
          } else {
            mensaje = 'Anciano';
          }
        }
      });
    } else {
      // Limpiar el mensaje si hay un error en la solicitud
      setState(() {
        edad = null;
        mensaje = ''; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinar edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
            'Ingrese un nombre para determinar la edad:',
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
                obtenerEdad(nombre);
              },
              child: const Text('Obtener Edad'),
            ),
            const SizedBox(height: 20),
            if (edad != null)
              Column(
                children: [
                  Text(
                    'Edad: $edad',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mensaje: $mensaje',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  if (mensaje == 'Joven')
                    Image.asset(
                      'assets/joven.jpg', 
                      width: 100,
                      height: 100,
                    )
                  else if (mensaje == 'Adulto')
                    Image.asset(
                      'assets/adulto.jpg', 
                      width: 100,
                      height: 100,
                    )
                  else if (mensaje == 'Anciano')
                    Image.asset(
                      'assets/anciano.jpg',
                      width: 100,
                      height: 100,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}