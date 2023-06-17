import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halo"),
      ),
      body: const Center(
        child: Text(
          "Halo Halo",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
