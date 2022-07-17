import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xypnos_training/api/controllers/category_controller.dart';
import 'package:xypnos_training/constants.dart';
import 'package:get/get.dart';

import 'category_tile.dart';
import '../../size_config.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
          style: TextStyle(
              // fontFamily: "Roboto",
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(23),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 20, right: 20, bottom: 60),
            child: Container(
                height: 70,
                width: 500,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "What do you want to learn ? ",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(15),
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: Icon(
                      Icons.search,
                      size: getProportionateScreenWidth(28),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: getProportionateScreenWidth(23),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Expanded(
            child: Obx(() {
              if (categoryController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: categoryController.categoryList.length,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child:
                          CategoryTile(categoryController.categoryList[index]),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
