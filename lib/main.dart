import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget with WidgetsBindingObserver {

  HomePage() {
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar());
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

//   int number = 0;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addObserver(this);
//     super.initState();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     print(state);
//    switch (state) {
//       case AppLifecycleState.resumed:
//         setState(() {
//           number = -20;
//         });
//         break;
//       case AppLifecycleState.inactive:
//         setState(() {
//           number = 99;
//         });
//         break;
//       case AppLifecycleState.paused:
//         print("App is in Paused State");
//         break;
//       case AppLifecycleState.detached:
//         print("App is in Detached State");
//         break;
//       default:
//     }
//     super.didChangeAppLifecycleState(state);
//   }

//   @override
//   void didChangeDependencies() {
//     print(number);
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("COUNTER"),
//       ),
//       body: Center(
//         child: Text(
//           "${number}",
//           style: TextStyle(fontSize: 35),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             number++;
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }