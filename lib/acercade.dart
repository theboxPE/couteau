import 'package:flutter/material.dart';


class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi página'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mis datos personales
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16.0),
              SizedBox(
                height: 150.0,
                width: 250.0,
                child: Image.asset('assets/fp.jpg'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Gabriel Adolfo Perez Regalado',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Desarrollador Flutter',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Correo:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const SelectableText(
                'perezregaladogabriel7@gmail.com',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'GitHub:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              const SelectableText(
                'https://github.com/theboxPE',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}