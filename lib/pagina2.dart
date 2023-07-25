import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsModel {
  final String id;
  final String title;
  final String description;
  final Map<String, dynamic> image;
  final DateTime date;
  final List<Map<String, dynamic>> related;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.related,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      related: List<Map<String, dynamic>>.from(json['related']),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias UTPL'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los datos'),
            );
          } else {
            final List<Map<String, dynamic>> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final description = item['description'] as String;
                final shortenedDescription = description.substring(0, 100) + "...";

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Get.to(() => DetailPage2(description: description));
                      },
                      leading: Image.network(item['image']['url']),
                      title: Text(item['title']),
                      subtitle: Text(shortenedDescription),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }


  // Función para obtener los datos del servicio web
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://appmovil.utpl.edu.ec:8080/v1/news/all?page=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}

class DetailPage2 extends StatelessWidget {
  final String description;

  DetailPage2({required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* Hero(
                tag: imageUrl,
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ), */
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para compartir en redes sociales
                },
                child: Text('Compartir en redes sociales'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}