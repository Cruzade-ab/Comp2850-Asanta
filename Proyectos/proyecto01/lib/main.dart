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
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 120.0,
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
              const Text(
                'FullStack Developer',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,                    ,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        '+1 787-602-5155',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text('abimael.santa1@gmail.com')
                    ],
                  ),
                ]),
              ),
              SizedBox(height: 40),
              Container(
                child: Image.asset("./images/qrCode.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
