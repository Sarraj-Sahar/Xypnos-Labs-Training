import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xypnos_training/Screens/Search/category_List.dart';
import 'package:xypnos_training/size_config.dart';

import '../../api/models/category_Model.dart';
import '../../api/services_2/remote_services.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  const CategoryTile(this.category);
//  CategoryTile({Key key, this.category,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          CategoryList(category: category),
          transition: Transition.leftToRightWithFade,
        );
      },
      child: Card(
        elevation: 2,
        child: Container(
          height: 80,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(fit: StackFit.expand, children: [
            Container(
              color: Colors.black,
              child: Opacity(
                opacity: 0.5,
                child: Image.network(
                  RemoteServices.cover_image_url + category.coverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenHeight(18),
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w800),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
