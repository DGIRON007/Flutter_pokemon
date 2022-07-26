import 'package:flutter/material.dart';
import 'package:flutter_application_pokemon/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'loading';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: RefreshIndicatorE(title: _title),
    );
  }
}

class RefreshIndicatorE extends StatefulWidget {
  const RefreshIndicatorE({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<RefreshIndicatorE> createState() =>
      _RefreshIndicatorState();
}

class _RefreshIndicatorState extends State<RefreshIndicatorE> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        
        
        
        color: Colors.white,
        backgroundColor: Color.fromRGBO(217, 66, 86, 10),
        strokeWidth: 2,
        
        onRefresh: () async {
          
          return Future<void>.delayed(const Duration(seconds: 2));
          
        },
        // Pull from top to show refresh indicator.
        child: 
        HomeScrenn()
      ),
    );
  }
}
