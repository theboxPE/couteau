import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';


class NoticiasWordPress extends StatefulWidget {
  const NoticiasWordPress({super.key});

  @override
  NoticiasWordPressState createState() => NoticiasWordPressState();
}
class NoticiasWordPressState extends State<NoticiasWordPress> {
  List<Map<String, dynamic>> noticias = [];

  Future<void> obtenerNoticias() async {
    final response = await http.get(Uri.parse('https://www.sonymusic.com/wp-json/wp/v2/posts?per_page=3'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        noticias.clear();
        for (final noticia in data) {
          noticias.add({
            'titulo': noticia['title']['rendered'],
            'resumen': noticia['excerpt']['rendered'],
            'enlace': noticia['link'],
          });
        }
      });
    } else {
      setState(() {
        noticias.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias WordPress'),
      ),
      body: Column(
        children: [
          // Mostrar el logo del sitio web
          Image.asset('assets/sonic.jpg'),
          const SizedBox(height: 20),
          // Mostrar las noticias
          Expanded(
            child: ListView.builder(
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                return Card(
                  child: ListTile(
                    title: Text(noticia['titulo']),
                    subtitle: Text(noticia['resumen']),
                    onTap: () => _launchURL(noticia['enlace']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

}

