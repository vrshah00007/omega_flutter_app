import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/screens/search/controller/search_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants_labels.dart';
import '../../../utils/custom_widgets/custom_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = Get.find<SearchAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                Get.back();
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setString('listOfCurrency', addCurrency);

              },
              icon: Icon(
                Icons.arrow_back,
                color: blueColor,
              )),
          // title: TextFormField(
          //   controller: searchController.searchController,
          //   onChanged: (value) {
          //     searchController.listSearch();
          //     searchController.update();
          //   },
          //   decoration: const InputDecoration(
          //     border: InputBorder.none,
          //     focusedErrorBorder: InputBorder.none,
          //     hintText: "Search...",
          //   ),
          // ),
          centerTitle: false,
        ),
        body: GetBuilder<SearchAppController>(
          builder: (controller) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: listOfCurrency.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Obx(() => Checkbox(
                        value: searchController.listCheck.value[index],
                        onChanged: (value) async {
                          if (value == true) {
                            listOfCurrencySearch.add(listOfCurrency[index]);
                          } else {
                            listOfCurrencySearch.remove(listOfCurrency[index]);
                          }
                          searchController.listCheck.value[index] = value!;
                          searchController.update();
                          searchController.listCheck.canUpdate;
                          print(listOfCurrencySearch);
                          if (addCurrency == "") {
                            addCurrency = listOfCurrency[index];
                          } else {
                            addCurrency =
                                "${addCurrency},${listOfCurrency[index]}";
                          }
                        },
                      )),
                  title: Text(listOfCurrency[index],
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                );
              },
            );
          },
        ));
  }
}
