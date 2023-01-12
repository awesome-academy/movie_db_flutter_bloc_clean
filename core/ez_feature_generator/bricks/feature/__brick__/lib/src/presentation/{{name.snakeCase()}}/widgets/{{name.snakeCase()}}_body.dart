import 'package:flutter/material.dart';

class {{name.pascalCase()}}Body extends StatelessWidget {
  const {{name.pascalCase()}}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("{{name.pascalCase()}} Body"),
      ),
    );
  }
}
