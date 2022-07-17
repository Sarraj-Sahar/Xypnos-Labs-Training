import 'package:get/state_manager.dart';
import 'package:xypnos_training/Screens/Course_Details/1_lessons.dart';
import 'package:xypnos_training/api/models/Chapter_model.dart';
import 'package:xypnos_training/api/models/course_model.dart';
import 'package:xypnos_training/api/models/event_model.dart';
import 'package:xypnos_training/api/models/wishlist_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';

class CourseController extends GetxController {
  //inside we need the items that we will bind to the UI
  //which are the lists

  var isLoading = true
      .obs; //making it observable , anytime the data changes that reflects in the UI

  // ignore: deprecated_member_use
  var allcoursesList = List<Course>().obs;

  // ignore: deprecated_member_use
  var popularcoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var trendingcoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var programmingcoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var aicoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var designcoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var toppickscoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var enrolledcoursesList = List<Course>().obs;
  // ignore: deprecated_member_use
  var enrolledeventsList = List<Events>().obs;

  // ignore: deprecated_member_use
  var wishlist = List<Wish>().obs;

  // ignore: deprecated_member_use
  var chaptersList = List<Chapter>().obs;

//
  // ignore: deprecated_member_use
  var latestCourse = Course().obs;

  // String id;
  // RxString id="0".obs;
  RxString id;

  Course course;
  int index;
//
// Can be turned into one function , fetchCourses according to category id ,
// If post categories would return it's courses
//
  @override
  void onInit() {
    fetchPopularCourses(id);
    fetchTrendingCourses(id);
    fetchAICourses(id);
    fetchGraphicDesignCourses(id);
    fetchProgrammingCourses(id);
    fetchTopPicksCourses(id);
    fetchEnrolledInCourses();
    fetchEnrolledInEvents();
    // fetchWishlist();
    fetchAllCourses();
    fetchLatestClass();
    super.onInit();
  }

//Latest Class

  void fetchLatestClass() async {
    try {
      isLoading(true);
      var course = await RemoteServices.getlatestcourse("last_course");
      if (course != null) {
        latestCourse.value = course;
      }
    } finally {
      isLoading(false);
    }
  }

  //WishList

  // void fetchWishlist() async {
  //   try {
  //     isLoading(true);
  //     var wishes = await RemoteServices.fetchEnrolledInCourse("wish_list");
  //     if (wishes != null) {
  //       wishlist.value = wishes as List<Wish>;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  //Enrolled In Courses

  void fetchEnrolledInCourses() async {
    try {
      isLoading(true);
      var courses =
          await RemoteServices.fetchEnrolledInCourse("user/enrolled_courses");
      if (courses != null) {
        enrolledcoursesList.value = courses;
      }
    } finally {
      isLoading(false);
    }
  }

  //Enrolled In Events

  void fetchEnrolledInEvents() async {
    try {
      isLoading(true);
      var events =
          await RemoteServices.fetchEnrolledInEvents("user/enrolled_events");
      if (events != null) {
        enrolledeventsList.value = events;
      }
    } finally {
      isLoading(false);
    }
  }

  //Popular Courses
  void fetchPopularCourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '1');
      if (courses != null) {
        popularcoursesList.value = courses;
      }
    } finally {
      isLoading(false);
    }
  }

  //Programming Courses

  void fetchProgrammingCourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '2');
      if (courses != null) {
        programmingcoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }

  //Trending Courses
  void fetchTrendingCourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '3');
      if (courses != null) {
        trendingcoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }

  //TopPicks Courses
  void fetchTopPicksCourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '4');
      if (courses != null) {
        toppickscoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }

  //AI Courses

  void fetchAICourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '5');
      if (courses != null) {
        aicoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }

  //GraphicDesign Courses
  void fetchGraphicDesignCourses(RxString id) async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses("courses?category=", '6');
      if (courses != null) {
        designcoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }

  //Fetch All courses
  void fetchAllCourses() async {
    try {
      isLoading(true);
      var courses = await RemoteServices.fetchCourses2("courses");
      if (courses != null) {
        allcoursesList.value = courses.cast<Course>();
      }
    } finally {
      isLoading(false);
    }
  }
}
