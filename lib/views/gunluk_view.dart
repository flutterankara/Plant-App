import 'package:flutter/material.dart';

class GunlukView extends StatefulWidget {
  const GunlukView({Key? key}) : super(key: key);

  @override
  State<GunlukView> createState() => _HomeViewState();
}

class _HomeViewState extends State<GunlukView> {
  List<int> list = [];
  TextEditingController _searchController = TextEditingController();
  List<int> filteredList = [];

  @override
  void initState() {
    super.initState();
    // Tüm liste elemanlarını başlangıçta filtelenmiş listeye ekleyin
    list = [
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
      1,
      2,
      3,
      4,
    ];
    filteredList.addAll(list);
  }

  void _filterList(String searchText) {
    setState(() {
      // Arama metni boşsa, tüm listeyi göster
      if (searchText.isEmpty) {
        filteredList.clear();
        filteredList.addAll(list);
      } else {
        // Arama metni doluysa, listeyi filtrele
        filteredList.clear();
        filteredList.addAll(
          list.where((element) => element.toString().contains(searchText)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      _filterList('');
                    },
                  ),
                ),
                onChanged: _filterList,
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
              itemCount: 4, // 4 tane kare blok
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
          child: Text(
            "Block ${index + 1}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
