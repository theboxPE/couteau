import 'package:flutter/material.dart';
import 'navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couteau',
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text(''),
              const SizedBox(height: 20), 
              SizedBox(
                height: 250.0,
                width: 350.0,
                child: Image.asset('assets/caja.jpg'),
              ),
            ],
          ),
        ),
      )
    );
  }
}





