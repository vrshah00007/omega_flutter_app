import 'package:get/get.dart';

class SearchAppController extends GetxController {
  RxBool selectedCheck = false.obs;
  RxString selectedIndex = "".obs;
  RxList<bool> listCheck = <bool>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkboxList();
  }
  checkboxList(){
    for (var i = 0; i < 10; i++) {
      // add the ListTile to an array
      listCheck.add(false);
    }
  }
}
