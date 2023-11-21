import 'package:brewvin_mobile/models/coffee_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailItemPage extends StatefulWidget {
  final CoffeeBean item;
  const DetailItemPage({super.key, required this.item});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Item"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.item.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              "Jumlah: ${widget.item.amount}",
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              "Deskripsi: ${widget.item.description}",
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              "Rasa: ${widget.item.taste}",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
