import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/screens/search/controller/search_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';

import '../../../utils/constants_labels.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = Get.find<SearchAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: blueColor,
              )),
          title: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: "Search...",
            ),
          ),
          centerTitle: false,
        ),
        body: GetBuilder<SearchAppController>(
          builder: (controller) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Obx(() => Checkbox(
                        value: searchController.listCheck.value[index],
                        onChanged: (value) {
                          searchController.listCheck.value[index] = value!;
                          searchController.update();
                          searchController.listCheck.canUpdate;
                        },
                      )),
                  title: Text("EURUSD",
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
