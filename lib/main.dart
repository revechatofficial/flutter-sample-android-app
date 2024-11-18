import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Add this to ensure proper error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Welcome to My App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.app/activity');

  Future<void> _openActivity() async {
    try {
      await platform.invokeMethod('openActivity');
    } on PlatformException catch (e) {
      print("Failed to open activity: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, Flutter!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20), // Adds space between text and button
            ElevatedButton(
              onPressed: _openActivity,
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(title: 'Welcome to My App'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final String title;
//
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hello, Flutter!',
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             SizedBox(height: 20), // Adds space between text and button
//             ElevatedButton(
//               onPressed: () {
//                 // Define the action when the button is pressed
//                 // For now, it simply prints a message to the console
//                 print('Start button pressed');
//               },
//               child: Text('Start'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
