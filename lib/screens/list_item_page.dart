import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/list_item_cubit.dart';
import '../models/coffee_bean.dart';
import '../widgets/left_drawer.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'List Item',
          ),
          backgroundColor: Colors.yellowAccent.shade700,
          foregroundColor: Colors.black,
        ),
        drawer: const LeftDrawer(),
        body: BlocBuilder<ListItemCubit, List<CoffeeBean>>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Nama: ${state[index].name}"),
                        Text("Jumlah: ${state[index].amount}"),
                        Text("Deskripsi: ${state[index].description}"),
                        Text("Rasa: ${state[index].taste}"),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
