import 'package:flutter/material.dart';
import 'package:langchain_app/langchain.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  LangAI langAI = LangAI();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: langAI.power2,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: langAI.power,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
