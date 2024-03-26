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
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(16.0), // Adjust padding as needed
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green, // Border color
                  width: 4.0, // Border width
                ),
              ),
              child: Image.asset('assets/Logo.webp'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green), // Background color
                foregroundColor:
                    MaterialStateProperty.all(Colors.amber), // Text color
              ),
              child: const Text("3 Step Recipes"),
            ),
          ],
        ),
      ),
    );
  }
}

//Routing Handle Initial to Recepies Page

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const RecepiesPage(),
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
  const RecepiesPage({super.key});

  @override
  _RecepiesPageState createState() => _RecepiesPageState();
}

class _RecepiesPageState extends State<RecepiesPage> {
  int _currentIndex = 0;

  final List<String> urls = [
    'https://cruzade-ab.github.io/food.html',
    'https://cruzade-ab.github.io/dessert.html',
    'https://cruzade-ab.github.io/drink.html'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Recepy'),
        backgroundColor: Colors.lightGreen, 
      ),
      body: WebView(
        key: UniqueKey(),
        initialUrl: urls[_currentIndex],
        javascriptMode: JavascriptMode.unrestricted,
        onWebResourceError: (WebResourceError error) {
          // Handle the error here
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(
                  'An error occurred while loading the page: ${error.description}'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
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
        backgroundColor: Colors.lightGreen, 
        selectedItemColor: Colors.amber, 
        unselectedItemColor: Colors.yellow,
        items: const [
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
