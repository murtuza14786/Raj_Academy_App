import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController();

  String responseMessage = '';

  Future<void> sendPostRequest() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final body = jsonEncode({
      'title': _titleController.text,
      'body': _bodyController.text,
      'userId': int.tryParse(_userIdController.text) ?? 1,
    });
    print(body);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          responseMessage = 'Post created! ID: ${data['title']}';
        });
      } else {
        setState(() {
          responseMessage = 'Failed: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = 'Error: $e';
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Body'),
                validator: (value) =>
                value!.isEmpty ? 'Enter the body' : null,
              ),
              TextFormField(
                controller: _userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Enter user ID' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendPostRequest();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text(responseMessage),
            ],
          ),
        ),
      ),
    );
  }
}
