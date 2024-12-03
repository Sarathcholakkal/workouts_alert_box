import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;
  String name = 'name display here';
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              'Name',
            ),
            Text(
              name,
            ),
            ElevatedButton(
                onPressed: () async {
                  final name = await OpenDialog();

                  if (name == null || name.isEmpty) {
                    return;
                  } else {
                    setState(
                      () => this.name = name,
                    );
                  }

                  print(
                      "$name....................................................................................................................................................................");
                },
                child: Text("create a playlist")),
          ],
        ),
      ),
    );
  }

  Future<String?> OpenDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("create a playlist"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter your name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text("submitt"),
            )
          ],
        ),
      );
}
