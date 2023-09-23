import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:omega_flutter_app/screens/search/controller/search_controller.dart';
import 'package:omega_flutter_app/screens/transaction/model/local_database_model.dart';
import 'package:omega_flutter_app/utils/color_const.dart';
import 'package:omega_flutter_app/utils/custom_textform_filed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants_labels.dart';
import '../../../utils/custom_widgets/custom_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = Get.find<SearchAppController>();
  var listOfData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchAppController>(builder: (logic) {
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
            title: TextFormField(
              controller: searchController.searchController,
              onChanged: (searchValue) {
                // print(value);
                if (searchController == "") {
                  listOfCurrencySearch.clear();
                } else {
                  listOfData = boxLocalDatabase?.values
                      .where((element) => element.currency!
                          .toLowerCase()
                          .contains(searchValue.toLowerCase()))
                      .toList();
                }
                // print(listOfCurrencySearchNew.map((e) => print(e.currency)));
                setState(() {
                  // print(listOfCurrencySearch);
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: "Search...",
              ),
            ),
            centerTitle: false,
          ),
          body: searchController.searchController.text.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: listOfData[index].isSelected,
                        onChanged: (value) async {

                          listOfData[index].isSelected =
                              !listOfData[index].isSelected;
                          boxLocalDatabaseSearch?.put(listOfData[index].currency,WatchListData(
                            currency: listOfData[index].currency,
                            isSelected:
                            listOfData[index].isSelected == true ? false : true,
                          ) );
                          // print(object);
                          boxLocalDatabase?.put(
                              listOfData[index].currency,
                              WatchListData(
                                currency: listOfData[index].currency,
                                isSelected:
                                listOfData[index].isSelected,
                              ));
                          if(listOfData[index]?.isSelected == true){
                            CustomWidget().customToast("${listOfData[index]?.currency} added");
                          }else{
                            CustomWidget().customToast("${listOfData[index]?.currency} removed");
                          }
                          setState(() {});
                        },
                      ),
                      title: Text(listOfData[index]?.currency ?? "",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                    );
                  },
                  itemCount: listOfData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: boxLocalDatabase?.length ?? 0,
                  itemBuilder: (context, index) {
                    final user = boxLocalDatabase?.getAt(index);
                    // print(boxLocalDatabase?.length);
                    return ListTile(
                      leading: Checkbox(
                        value: user?.isSelected,
                        onChanged: (value) async {
                          setState(() {});
                          if(value == true){
                            CustomWidget().customToast("${user?.currency} added");
                          }else{
                            CustomWidget().customToast("${user?.currency} removed");
                          }
                          boxLocalDatabaseSearch?.put(user?.currency,WatchListData(
                            currency: user?.currency,
                            isSelected:
                            user?.isSelected == true ? false : true,
                          ) );
                          boxLocalDatabase?.put(
                              user?.currency,
                              WatchListData(
                                currency: user?.currency,
                                isSelected:
                                    user?.isSelected == true ? false : true,
                              ));
                          // if(user?.isSelected == true){
                          //   CustomWidget().customToast("${user?.currency} added");
                          // }else{
                          //   CustomWidget().customToast("${user?.currency} removed");
                          // }
                          // boxLocalDatabase?.toMap().forEach((key, value) {
                          //   if (value.isSelected == true) {
                          //     if (addCurrency == "") {
                          //       // addCurrency = user?.currency ?? "";
                          //       // addCurrency.contains(user?.currency as Pattern,0);
                          //       // listOfCurrency.add(user?.currency);
                          //     } else {
                          //       // addCurrency = "$addCurrency,${user?.currency}";
                          //     }
                          //     // print(value.isSelected);
                          //     print("currency $addCurrency");
                          //   }
                          // });
                          // searchController.listCheck.value[index] = value!;
                          // searchController.update();
                          // searchController.listCheck.canUpdate;
                          // print(listOfCurrencySearch);
                          // print(object)
                          // if (addCurrency == "") {
                          //   addCurrency = listOfCurrency[index];
                          // } else {
                          //   addCurrency = "${addCurrency},${listOfCurrency[index]}";
                          // }
                        },
                      ),
                      title: Text(user?.currency ?? "",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                    );
                  },
                ));
    });
  }
}
