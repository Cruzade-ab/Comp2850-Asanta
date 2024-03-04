import 'package:flutter/material.dart';

void main() => runApp(const MiTarjeta());

class MiTarjeta extends StatelessWidget {
  const MiTarjeta({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Tarjeta Digital'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 90.0,
                backgroundImage: AssetImage('./images/ImagenPerfil.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Abimael Santa',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FullStack Developer',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[700],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Column(children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.teal[900],
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  '+1-787-602-5155',
                                  style: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: Colors.teal[900],
                                ),
                                const SizedBox(width: 10.0),
                                Text('abimael.santa1@gmail.com')
                              ],
                            ),
                            Row( 
                              children: <Widget>[
                              const CircleAvatar(
                              radius: 90.0,
                              backgroundImage: AssetImage('./images/qrCode.png'))],)
                          ]),
                        ),
              const SizedBox(height: 40),
// Repetir Container para otros detalles decontacto...
            ],
          ),
        ),
      ),
    );
  }
}
