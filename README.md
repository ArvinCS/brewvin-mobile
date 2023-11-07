## Brew'vin Mobile

## List of Content
- [Tugas 7](#tugas-7)

### Tugas 7
- ##### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

    Perbedaan utama stateless dan stateful terletak pada immutablenya. Stateless bersifat immutable, widget-widget yang berada di dalamnya tidak akan berubah. Sedangkan, stateful bersifat mutable, widget-widget di dalamnya dapat berubah bergantung pada state.

- ##### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    - InkWell : Sebuah widget untuk memberi efek touch ketika ditekan.
    - Center : Sebuah widget untuk meletakkan childnya di posisi tepat di tengah.
    - Icon : Sebuah widget untuk memunculkan sebuah icon.
    - Padding : Sebuah widget untuk memberikan padding pada childnya.
    - GridView : Sebuah widget untuk memberikan view dengan list data yang diberikan
    - SingleChildScrollView : Sebuah widget untuk memungkinkan childnya yang panjang menjadi scrollable.
    - Scaffold : Sebuah widget yang memungkinkan untuk menambahkan appbar, child, footer, floating button, dan lain-lain.
    - Column : Sebuah widget untuk menampilkan children dalam kolom.

- ##### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    1. Membuat flutter app project dengan nama `brewvin_mobile`.
    2. Membuat home page.
    ```
    class HomePage extends StatefulWidget {
        const HomePage({super.key});

        @override
        State<HomePage> createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist),
            ShopItem("Tambah Item", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'Shopping List',
                    ),
                ),
                body: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Text(
                                    'PBP Shop',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                            // Grid layout
                            GridView.count(
                                primary: true,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: items.map((ShopItem item) {
                                    return ShopCard(item);
                                    }).toList(),
                                ),
                            ],
                        ),
                    ),
                ),
            );
        }
    }
    ```
    3. Membuat model untuk `ShopItem`.
    ```
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
    ```
    4. Membuat sub-komponen untuk memunculkan `ShopItem`.
    ```
    class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key});

        @override
        Widget build(BuildContext context) {
            return Material(
                color: Colors.yellow.shade700,
                child: InkWell(
                    onTap: () {
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Kamu telah menekan tombol ${item.name}!")));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        item.icon,
                                        color: Colors.white,
                                        size: 30.0,
                                    ),
                                    const Padding(padding: EdgeInsets.all(3)),
                                    Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            );
        }
    }
    ```
    5. Integrasi home page dengan `main.dart`.
    ```
    void main() {
        runApp(const MainApp());
    }

    class MainApp extends StatelessWidget {
        const MainApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            ),
            home: const HomePage()
            );
        }
    }
    ```
