import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//Main aplication Loop
void main() {
  runApp(const MaterialApp(
    home: InitialPage(),
  ));
}

//Initial Page (Logo,Botton to navigate to the Recepies)
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text("Abi's Recepies"),
        ),
      ),
    );
  }
}

//Routing Handle Initial to Recepies Page

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RecepiesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//Recepies Page, TabNavigation to web_view
class RecepiesPage extends StatefulWidget {
  RecepiesPage({super.key});

  @override
  _RecepiesPageState createState() => _RecepiesPageState();
}

class _RecepiesPageState extends State<RecepiesPage> {
  int _currentIndex = 0;

  final List<String> urls = [
    'http://arecibo.inter.edu/recepies/food',
    'http://arecibo.inter.edu/recepies/dessert',
    'http://arecibo.inter.edu/recepies/drink'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Recepy'),
      ),
      body: WebView(
        initialUrl: urls[_currentIndex],
        
        javascriptMode: JavascriptMode.unrestricted, 
        
        onWebResourceError: (WebResourceError error) {
          // Handle the error here
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred while loading the page: ${error.description}'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Dessert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Drink',
          ),
        ],
      ),
    );
  }
}