import 'package:get/state_manager.dart';
import 'package:xypnos_training/api/models/category_Model.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs; //
  // ignore: deprecated_member_use
  var categoryList = List<Category>().obs;
  // ignore: deprecated_member_use

  // ignore: deprecated_member_use
  var eventsList = List<Events>().obs;

  @override
  void onInit() {
    fetchCategories();
    // fetchEnrolments();
    fetchEvents();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var categories = await RemoteServices.fetchCategories("categories");
      if (categories != null) {
        categoryList.value = categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchEvents() async {
    try {
      isLoading(true);
      var events = await RemoteServices.fetchEvents("events");
      if (events != null) {
        eventsList.value = events;
      }
    } finally {
      isLoading(false);
    }
  }
}
