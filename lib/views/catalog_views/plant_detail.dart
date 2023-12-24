import 'package:flutter/material.dart';

class PlantDetailView extends StatefulWidget {
  const PlantDetailView({Key? key}) : super(key: key);

  @override
  State<PlantDetailView> createState() => _PlantDetailViewState();
}

class _PlantDetailViewState extends State<PlantDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
                "https://www.gazetekadikoy.com.tr/images/upload/9-validebag_bitki_10.JPG__Bellis_perennis-koyun_goYzuY_1.jpg"),
            const Row(
              children: [Text("Tür: "), Text("Çiçek")],
            ),
            const Row(
              children: [Text("Renk: "), Text("beyaz")],
            ),
            const Row(
              children: [Text("Cins: "), Text("Çiçek")],
            ),
            const Text(
                "Açıklama: lkalksflkakslfklakljflkjaflkjlkaflkjalkflkalkjflk"
                "jagksnnlnvkljdfznmvmnhjhjlamnfmnlhvoaıfnalmnlmnvmznkj"
                "falkhfflkhfmbvöm nfln cvm svnldnlm")
          ],
        ),
      ),
    );
  }
}
