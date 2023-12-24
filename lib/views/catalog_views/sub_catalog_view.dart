import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:plant/views/catalog_views/plant_detail.dart';

class SubCategoriesPage extends StatefulWidget {
  SubCategoriesPage({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  State<SubCategoriesPage> createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitkiler"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetailView(),
                      ));
                },
                child: Card(
                    child: SizedBox(
                        width: context.sized.dynamicWidth(0.6),
                        child: Center(child: Text("${index}")))),
              ));
            },
          )
        ],
      )),
    );
  }
}
