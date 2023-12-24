import 'package:flutter/material.dart';
import 'package:plant/views/diary_view/diary_add_view.dart';

class GunlukView extends StatefulWidget {
  const GunlukView({Key? key}) : super(key: key);

  @override
  State<GunlukView> createState() => _HomeViewState();
}

class _HomeViewState extends State<GunlukView> {
  List<String> list = [
    "https://www.bugday.org/blog/wp-content/uploads/2020/11/A1B1-bca0xL._AC_SL1500_.jpg",
    "https://ideacdn.net/idea/ge/96/myassets/blogs/flower-garden.jpg?revision=1678962649",
  ];
  TextEditingController _searchController = TextEditingController();
  List<int> filteredList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiaryAddView(),
                ));
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Gunluk"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Ara...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                ),
                onChanged: null,
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12, // 4 tane kare blok
              itemBuilder: (context, index) {
                return buildBlock(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlock(int index) {
    return Card(
      child: Container(
        height: 55,
        color: Colors.green,
        child: Center(
          child: Image.network(
            list[index % list.length],
          ),
        ),
      ),
    );
  }
}
