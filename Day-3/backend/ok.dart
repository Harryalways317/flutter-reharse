import 'package:get/get.dart';
import 'package:icog/api/base_url.dart';
import 'package:icog/controllers/flavour_url_controller/flavour_controller.dart';
import 'package:icog/models/content_model/content_model.dart';
import 'package:icog/models/course_info_model/course_info_model.dart';
import 'package:icog/services/base_client.dart';

class SearchController extends GetxController {
  //String keyword = "";
  List results = [];
  String preference = "";
  String keyword = "";
  List<CourseInfoModel> courseModel = [];
  List<ContentModel> contentModel = [];

  var res = Get.find<FlavorController>().url;

  //https://crisil.icogstage.com/icog/services/course/list?records=9&pindex=0&keyword=test

  Future getSearchItems(String key) async {
    var result = await BaseClient()
        .get(res, BaseUrl().KEYWORDS_SEARCH + "limit=15&prefix=${key}");
    results = [];

    for (var i = 0; i < result.length; i++) {
      results.add(result[i]["topic"]);
    }

    //+ '&fld=firstName%2ClastName'
    print(key);
    print(results);

    update();
  }

  Future getSearchCoursesKeyword() async {
    print(keyword);
    // var result = await BaseClient().get(res,
    //     BaseUrl().COURSES_SEARCH_URL + "records=9&pindex=0&keyword=$keyword");
    var result = await BaseClient().get(res,
        BaseUrl().COURSES_SEARCH_URL + "records=9&pindex=0&keyword=$keyword");

    //+ '&fld=firstName%2ClastName'

    Iterable result_courses = result['data'];

    courseModel =
        result_courses.map((model) => CourseInfoModel.fromJson(model)).toList();
    print(keyword);
    print(courseModel[0].name);

    update();
  }

  Future getPreferences() async {
    var result = await BaseClient()
        .get(res, BaseUrl().USER_PREFERENCES + "fld=pref_category");
    print(result);
    preference = result["pref_category"][0]["PrefCatName"];
  }

  Future getSearchContentKeyword() async {
    print(keyword);
    print(preference);
    var result = await BaseClient().get(
        res,
        BaseUrl().CONTENT_SEARCH +
            "records=9&pindex=0&fld=category%2Cformat%2Cduration%2Ctype%2Cnodeuuid%2Ctitle%2Cdescription%2Cfees%2Cpaid%2Curl%2Cplayerdoc%2CtotalThumbsDown%2CtotalThumbsUp%2Cbookmark%2Cmyvoting%2Cscope%2Caccessibility%2Cimage_url%2Cstatus&category=${preference.toLowerCase()}&searchterm=$keyword&formatFilter=&accessFilter=free%2Cunsubscribed%2Csubscribed&type=");

    //+ '&fld=firstName%2ClastName'
    print(result);

    Iterable result_content = result['result'];

    contentModel =
        result_content.map((model) => ContentModel.fromJson(model)).toList();
    print(keyword);
    print(contentModel[0].nodeuuid);

    update();
  }
}
