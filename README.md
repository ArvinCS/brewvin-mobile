## Brew'vin Mobile

## List of Content

- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

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

### Tugas 8

- ##### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

  `Navigator.push()` akan menambahkan page tujuan ke dalam stack route. Sehingga, ketika di-pop, maka akan kembali ke page sebelumnya yang dikunjungi. Misalnya, menggunakan ini untuk menuju ke page detail dari sebuah item di list page. Sedangkan, `Navigator.pushReplacement()` akan menghapus semua page dalam stack route, dan menimpanya dengan page yang dituju. Misalnya, menggunakan ini untuk menuju ke halaman home setelah berhasil login dari sign in page.

- ##### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

  Layout widget dapat dibagi menjadi beberapa jenis, yaitu Single-child layout, Multi-child layout, dan Sliver. Single-child hanya dapat memiliki satu child di dalamnya, biasanya digunakan untuk mengatur layout dari spesifik suatu widget child. Sedangkan, multi-child layout dapat memiliki banyak child di dalamnya, biasanya digunakan untuk mengatur posisi antar child di dalam layout tersebut. Sliver merupakan jenis layout yang spesial karena menggunakan RenderSliver dibandingkan yang lainnya menggunakan RenderBox. Penggunaan Sliver cukup jarang digunakan kecuali pada kasus tertentu.

- ##### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

  - TextFormField dengan type number yang digunakan untuk meminta input `amount` berupa angka bilangan positif. Data tersebut mewakilkan banyak item yang tersedia.
  - TextFormField dengan type text yang digunakan untuk meminta input `name, description, taste` berupa teks. Name mewakilkan nama dari item. Kemudian, description mewakilkan deskripsi dari item. Terakhir, taste mewakilkan rasa dari item tersebut.

- ##### Bagaimana penerapan clean architecture pada aplikasi Flutter?

  Clean architecture pada flutter biasanya dibagi menjadi 3 layer yaitu feature, domain, dan data. Alasannya adalah separation of concerns. Feature mencakup widget dan state management. Kemudian, domain mencakup use cases dan objek model. Terakhir, data mencakup remote/local data sources dan repositories.

- ##### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

  1. Membuat drawer.

  ```
  class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
      return Drawer(
      child: ListView(
          children: [
          DrawerHeader(
              decoration: BoxDecoration(
              color: Colors.yellowAccent.shade700,
              ),
              child: const Column(
              children: [
                  Text(
                    'Brew\'vin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10)),
                  Text(
                    "Pesan kopi kesayanganmu di sini",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
              ),
          ),
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke HomePage
              onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(),
                  ));
              },
          ),
          ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShopFormPage(),
                  ));
              },
          ),
          ListTile(
              leading: const Icon(Icons.list_outlined),
              title: const Text('Lihat Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListItemPage(),
                  ));
              },
          ),
          ],
      ),
      );
  }
  }
  ```

  2. Membuat model `CoffeeBean`.

  ```
    class CoffeeBean {
    String name, description, taste;
    int amount;

    CoffeeBean(
        {required this.name,
        required this.description,
        required this.taste,
        required this.amount});
    }
  ```

  3. Membuat page untuk add item di `screens/add_item_page.dart`.

  4. Membuat cubit berupa state management untuk handle list item page, terletak di `cubit/list_item_cubit`. Kemudian, menambahkan provider ke root main.

  5. Membuat page untuk memunculkan list item memanfaatkan cubit yang telah dibuat, terletak di `screens/list_item_page`.

### Tugas 9

- ##### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

  Bisa saja, namun data json yang kita terima akan berupa `map<String, dynamic>`. Sehingga, kita perlu akses data dengan cara map seperti biasa. Jika ingin data yang diterima lebih terstruktur dan dokumentasi yang lebih baik, membuat model terlebih dahulu kemudian diparse saat mengambil data JSON. Namun, perlu diupdate setiap ada perubahan field atau struktur data lainnya.

- ##### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

  CookieRequest berfungsi semacam middleware untuk memberikan headers cookie sebelum kita mengirim request ke server django. Sehingga, request yang diberikan mempunyai kredensial user. CookieRequest perlu dibagikan ke semua komponen agar dapat diakses dalam komponen tersebut.

- ##### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

  1. Buat UI yang akan ditampilkan terlebih dahulu.
  2. Lakukan pemanggilan data dari endpoint JSON tersebut. Maka, yang diterima berupa data dengan type `Map<String, dynamic>`.
  3. Konversi map tersebut menjadi sebuah objek dari model yang telah kita buat khusus untuk item tersebut.
  4. Update state untuk UI tersebut sehingga dapat ditampilkan datanya.

- ##### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

  1. Buat Form autentikasi pada Flutter terlebih dahulu.
  2. Lakukan POST Request ke endpoint, dengan data berupa form autentikasi yang dikonversi menjadi JSON.
  3. Cek response yang didapatkan, jika status code 200, maka berhasil.
  4. Simpan cookie tersebut.
  5. Setiap melakukan request, bawa cookie tersebut ke dalam headers requestnya.
  6. Maka, data yang ditampilkan akan berdasarkan kredensial user tersebut.

- ##### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

  - Elevated button, widget tombol yang dapat dikustomisasi beserta event handlernya.
  - RichText, widget text yang dapat dinest dengan widget text lainnya.
  - TextField, widget untuk menerima input text user.
  - ListView, widget untuk membuat list dari widget.
  - InkWell, widget untuk memberikan efek sentuhan dan dapat dikustomisasi event handlernya.

- ##### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

  1. Setup server django agar dapat menerima request dari mobile app yang dibuat.
  2. Setup flutter project ini agar bisa mengirim request dengan `CookieRequest`.
  3. Membuat tampilan untuk login, register, detail item.
  4. Integrasi tampilan yang telah dibuat dengan backend dari server django dengan membuat function yang mengirim request ke server.
  5. Tambahkan validasi input seperti input kosong, tidak sama, dan lain-lain.
