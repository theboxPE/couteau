import 'package:flutter/material.dart';
import 'navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text('Hello World'),
              const SizedBox(height: 20), 
              SizedBox(
                height: 150.0,
                width: 250.0,
                child: Image.asset('assets/caja.jpg'),
              ),
            ],
          ),
        ),
      )
    );
  }
}





