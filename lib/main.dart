import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto_gp/pagina1.dart';
import 'package:reto_gp/pagina2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/pagina1', page: () => Pagina1()),
        GetPage(name: '/pagina2', page: () => Pagina2())
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Color(0xFFFDBF4E), // Amarillo agradable a la vista
        appBarTheme: AppBarTheme( // Agrega esta parte para cambiar el color de la AppBar
          color: Color.fromARGB(255, 20, 70, 146), // Azul marino bien oscuro
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios UTPL'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, const Color.fromARGB(255, 10, 58, 129)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/utpl.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20), // Espacio entre la imagen y los botones
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pagina1');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFDBF4E),
                      padding: EdgeInsets.symmetric(vertical: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centra horizontalmente
                      children: [
                        Image.asset(
                          'assets/cinema.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'CINEFORO',
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'BebasNeue-Regular',
                          ),
                          textAlign: TextAlign
                              .center, // Centra el texto dentro del botón
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pagina2');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFDBF4E),
                      padding: EdgeInsets.symmetric(vertical: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centra horizontalmente
                      children: [
                        Image.asset(
                          'assets/news.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'NOTICIAS',
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'BebasNeue-Regular',
                          ),
                          textAlign: TextAlign
                              .center, // Centra el texto dentro del botón
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
