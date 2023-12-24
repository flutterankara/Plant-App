import 'package:flutter/material.dart';
import 'package:plant/models/FlowerModel.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<FlowerModel> flowerList = [
    FlowerModel(1, 'Papatya', 'Beyaz ve sarı renkli, sevimli bir çiçek.',
        'Çok yıllık', 'Bahçe Çiçeği'),
    FlowerModel(2, 'Gül', 'Kırmızı renkli, güzel ve kokulu bir çiçek.',
        'Çok yıllık', 'Kesme Çiçek'),
    FlowerModel(3, 'Lavanta', 'Mor renkli, hoş kokulu bir çiçek.', 'Çok yıllık',
        'Aromatik Çiçek'),
    FlowerModel(4, 'Gardenya', 'Beyaz renkli, yoğun kokulu bir çiçek.',
        'Çok yıllık', 'Süs Bitkisi'),
    FlowerModel(5, 'Orkide', 'Farklı renk ve türleri olan egzotik bir çiçek.',
        'Çok yıllık', 'Orman Çiçeği'),
    FlowerModel(6, 'Menekşe', 'Mavi, beyaz veya mor renkli, zarif bir çiçek.',
        'Yıllık', 'Bahçe Bitkisi'),
    FlowerModel(
        7,
        'Süsen',
        'Beyaz veya sarı renkli, baharın habercisi bir çiçek.',
        'Yıllık',
        'Doğal Bitki'),
    FlowerModel(
        8,
        'Zambak',
        'Beyaz, sarı, pembe veya kırmızı renkli, zarif bir çiçek.',
        'Çok yıllık',
        'Kesme Çiçek'),
    FlowerModel(
        9,
        'Krizantem',
        'Sonbahar çiçeği olarak bilinen renkli bir çiçek.',
        'Yıllık',
        'Bahçe Çiçeği'),
    FlowerModel(10, 'Sardunya', 'Renkli ve hoş kokulu bir yaz çiçeği.',
        'Yıllık', 'Balkon Çiçeği'),
  ];
  @override
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';
  List<String> items = [
    'Items 1',
    'Messi',
    'Ronaldo',
    'Virat Kohli',
    '2',
    'Rock',
    'Elon Musk',
  ];

  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Search View"),
      ),
      // body parts
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    hintText: 'Search..'),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: flowerList.length,
              itemBuilder: (context, index) {
                String flowerName = flowerList[index].name;

                return ListTile(
                  title: Text(flowerName),
                );
              },
            )
          ],
        ),
      ),
    );
  }
/*Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [
      //search
      //liste oluştur, içerisinde arama yapsın listview builder
    ],)),);*/
}
