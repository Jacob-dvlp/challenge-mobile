import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  fech() async {
    final data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    print(data.body);
  }

  @override
  void initState() {
    fech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Container(),
    );
  }
}
