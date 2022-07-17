import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:xypnos_training/Screens/Home/Course_card_categview.dart';
import 'package:xypnos_training/api/controllers/category_controller.dart';
import 'package:xypnos_training/api/controllers/course_contoller.dart';
import 'package:xypnos_training/api/models/category_Model.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:get/get.dart';

import '../../size_config.dart';

class CategoryList extends StatefulWidget {
  final Category category;
  CategoryList({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryController categoryController = Get.put(CategoryController());

  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    var id = this.widget.category.id;
    // ignore: deprecated_member_use
    var courseList = List<Course>();

    if (id == 1) {
      courseList = courseController.popularcoursesList;
    } else if (id == 2) {
      courseList = courseController.programmingcoursesList;
    } else if (id == 3) {
      courseList = courseController.trendingcoursesList;
    } else if (id == 4) {
      courseList = courseController.toppickscoursesList;
    } else if (id == 5) {
      courseList = courseController.aicoursesList;
    } else if (id == 6) {
      courseList = courseController.designcoursesList;
    }

    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backwardsCompatibility: false,
        automaticallyImplyLeading: false,
        title: Text(
          this.widget.category.name,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: buildHomeContent5(courseList),
    );
  }

  Widget buildHomeContent5(RxList<Course> list) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 750,
            width: 400.0,
            child: Obx(
              () {
                if (courseController.isLoading.value)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: list.length,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return Flexible(child: CourseCardCategory(list[index]));
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
