import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF194B5F),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final double coverHeight = 280;
  final double perfilHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Top(coverHeight, perfilHeight),
        Content(),
      ],
    ));
  }
}

Widget Top(coverHeight, perfilHeight) {
  final top = coverHeight - perfilHeight / 2;
  final bottom = perfilHeight / 2;
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(margin: EdgeInsets.only(bottom: bottom), child: PortadaImage()),
      Positioned(
        top: top,
        child: PerfilImage(),
      )
    ],
  );
}

Widget Content() => Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          'Abimael Santa',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Full Stack Developer',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 16,
        ),
        mailPhone(),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Scan QR Code',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        Container(
          width: 250,
          height: 250,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("./images/qrCode.png"), fit: BoxFit.cover)),
        ),
      ],
    );

class PerfilImage extends StatelessWidget {
  final double perfilHeight = 164;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
          radius: perfilHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage("./images/ImagenPerfil.jpg")),
    );
  }
}

class PortadaImage extends StatelessWidget {
  final double coverHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Image(
        image: AssetImage("./images/coolComputer.jpeg"),
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ContentBox extends StatelessWidget {
  final String title;
  final IconData icon;

  const ContentBox({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(237, 242, 244, 1.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xFF194B5F),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF194B5F), fontSize: 19.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget mailPhone() => Container(
      alignment: Alignment.center,
      child: Column(children: [
        ContentBox(title: 'abimael.santa1@gmail.com', icon: Icons.email),
        ContentBox(title: '+1(787)602-5155', icon: Icons.phone)
      ]),
    );




// Widget buildSocialIcon(IconData icon) => CircleAvatar(
//       radius: 25,
//       backgroundColor: Colors.blue,
//       child: Center(
//         child: Icon(
//           icon,
//           size: 32,
//           color: Colors.black,
//         ),
//       ),
//     );

// Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             buildSocialIcon(FontAwesomeIcons.github),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSocialIcon(FontAwesomeIcons.youtube),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSocialIcon(FontAwesomeIcons.discord),
//             const SizedBox(
//               width: 12,
//             ),
//             buildSocialIcon(FontAwesomeIcons.linkedin),
//             const SizedBox(
//               width: 12,
//             ),
//           ],
//         ),


// Widget About() => Container(
//       padding: EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'About',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Software Developer at ',
//             style: TextStyle(fontSize: 18, height: 1.4),
//           )
//         ],
//       ),
//     );
