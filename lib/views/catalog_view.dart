import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:plant/views/catalog_views/sub_catalog_view.dart';

import '../../data/data_file.dart';
import '../../models/CategoryModel.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  _CategoriesPage createState() {
    return _CategoriesPage();
  }
}

class _CategoriesPage extends State<CategoriesView> {
  List<CategoryModel> categoryModelList = DataFile.getCategoryModel();

  @override
  void initState() {
    super.initState();
    categoryModelList = DataFile.getCategoryModel();
    setState(() {});
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    double viewWidth = context.sized.dynamicWidth(0.6);
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = _width;
    var _aspectRatio = _width / cellHeight;

    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text('Categories'),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.01),
                  child: GridView.count(
                    crossAxisCount: _crossAxisCount,
                    shrinkWrap: true,
                    childAspectRatio: _aspectRatio,
                    // childAspectRatio: 0.64,
                    primary: false,
                    children: List.generate(categoryModelList.length, (index) {
                      return BackGroundTile(
                        subCategoryModel: categoryModelList[index],
                        cellHeight: cellHeight,
                      );
                    }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: viewWidth,
                    height: 5,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class BackGroundTile extends StatelessWidget {
  final CategoryModel? subCategoryModel;
  final double? cellHeight;

  BackGroundTile({super.key, this.subCategoryModel, this.cellHeight});

  @override
  Widget build(BuildContext context) {
    double imageSize = context.sized.dynamicHeight(0.1);
    double radius = 12;
    double bottomRemainSize = cellHeight! - imageSize;

    return InkWell(
      child: Container(
        height: cellHeight,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Color>(
                future: null,
                //This function return color from Sqlite DB Asynchronously
                builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
                  Color color;
                  if (snapshot.hasData) {
                    color = snapshot.data!;
                  } else {
                    color = Colors.grey;
                  }

                  return Container(
                    height: imageSize,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 9, right: 9, top: 9),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                    child: Image.network(
                        "https://www.labmedya.com/uploads/sayilar/lab63/labmedya_bitkiler-direnebilirmi.jpg"),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                subCategoryModel!.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),

              child: Text(
                subCategoryModel!.desc,
              ),
              // child: ConstantWidget.getCustomText(
              //     subCategoryModel.item,
              //     ConstantData.textColor1,
              //     1,
              //     TextAlign.center,
              //     FontWeight.w700,
              //     ConstantWidget.getPercentSize(bottomRemainSize, 13)),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoriesPage(
                      id: subCategoryModel!.id,
                    )));
      },
    );
  }
}
