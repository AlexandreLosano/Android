import 'package:flutter/material.dart';

class VisualizarPage extends StatelessWidget {
  const VisualizarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar'),
      ),
      body: const Center(
        child: Text('Página de Visualizar'),
      ),
    );
  }
}
