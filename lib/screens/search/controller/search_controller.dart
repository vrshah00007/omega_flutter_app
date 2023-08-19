import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/custom_widgets/custom_widget.dart';

class SearchAppController extends GetxController {
  RxBool selectedCheck = false.obs;
  RxString selectedIndex = "".obs;
  RxList<bool> listCheck = <bool>[].obs;
  RxList<bool> listCheckSearch = <bool>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkboxList();
  }

  checkboxList() {
    for (var i = 0; i < listOfCurrency.length; i++) {
      // add the ListTile to an array
      listCheck.add(false);
    }
  }

  listSearch() {
    for (var p in listOfCurrency) {
      if (p == searchController.text) {
          listOfCurrencySearch.add(p);

            for (var i = 0; i < listOfCurrencySearch.length; i++) {
              // add the ListTile to an array
              listCheckSearch.add(false);
            }

      }
    }
  }
}
