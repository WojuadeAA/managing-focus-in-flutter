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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Managing Focus with Flutter'),
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
  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;

  @override
  void initState() {
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                focusNode: nameFocusNode,
                onEditingComplete: () {
                  nameFocusNode.nextFocus();
                },
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 25.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                focusNode: emailFocusNode,
                onEditingComplete: () {
                  emailFocusNode.nextFocus();
                },
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
