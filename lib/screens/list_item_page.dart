import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../models/coffee_bean.dart';
import '../widgets/left_drawer.dart';
import 'detail_item_page.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  Future<List<CoffeeBean>> fetchAllItems(CookieRequest request) async {
    List<CoffeeBean> items = [];
    final response = await request.get('http://10.0.2.2:8000/json/');
    debugPrint(response.toString());
    response.forEach((element) {
      debugPrint(element.toString());
      items.add(CoffeeBean.fromJson(element["fields"]));
    });
    return items;
  }

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
        body: FutureBuilder(
          future: fetchAllItems(context.read<CookieRequest>()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text("Tidak ada item."));
            }

            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  CoffeeBean item = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailItemPage(item: item),
                          ),
                        );
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 201, 187, 61),
                        child: Column(
                          children: [
                            Text("Nama: ${item.name}"),
                            Text("Jumlah: ${item.amount}"),
                            Text("Deskripsi: ${item.description}"),
                            Text("Rasa: ${item.taste}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
