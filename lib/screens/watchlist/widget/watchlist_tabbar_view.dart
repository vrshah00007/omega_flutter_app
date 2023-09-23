import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_flutter_app/screens/dashboard/controller/dashboard_controller.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

import '../../../utils/custom_widgets/custom_widget.dart';
import '../../invest/view/invest_screen.dart';

class WatchlistTabBarView extends StatelessWidget {
  WatchlistTabBarView({Key? key}) : super(key: key);
  TextEditingController moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: greyColor,
                  thickness: 3,
                );
              },
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: model.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    alertBoxBuySell(context, model[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model[index]['s'],
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Timestrap",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "${model[index]['t']}",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Image.asset(
                                "assets/home_screen_icons/Untitled-1 1.png"),
                          ),
                          Column(
                            children: [
                              Text(
                                "${model[index]['p']}",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/home_screen_icons/Polygon 3.svg",
                                      height: 10,
                                      width: 10),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${model[index]['a']}",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/home_screen_icons/Polygon 4.svg",
                                      height: 10,
                                      width: 10),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${model[index]['b']}",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }

  Future<dynamic> alertBoxBuySell(BuildContext context, var model) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.all(10),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // color: Colors.white,
          // width: Get.width,
          width: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: Get.height * .38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 12,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Currency"),
                    Text(
                      "${model['s']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Bid"),
                    Text("${model['b']}"),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Ask"),
                    Text("${model['a']}"),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Available Balance',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("\$ ${availableBalance}",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                      controller: moneyController,
                      // maxLines: 1,
                      cursorColor: greenColor,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SvgPicture.asset(
                            "assets/drawer_icons/🦆 icon _dollar square_.svg",
                            // fit: BoxFit.cover,
                            // height: 20,
                            // width: 20,
                          ),
                        ),
                        // contentPadding: const EdgeInsets.fromLTRB(14, 0, 0, 30),
                        // prefixIcon: ,

                        focusedErrorBorder: buildOutlineInputBorder(),
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorder(),

                        errorBorder: buildOutlineInputBorder(),
                        enabledBorder: buildOutlineInputBorder(),
                        disabledBorder: buildOutlineInputBorder(),
                        labelText: 'Amount',
                        labelStyle: const TextStyle(color: Colors.black),
                      )),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 12),
                padding:
                    const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                decoration: BoxDecoration(
                    color: const Color(0XFFDADADA).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (moneyController.text.isEmpty) {
                            CustomWidget().customSnackBar(
                                message: 'Please enter the amount');
                          } else {
                            Get.find<DashboardController>().buy(
                                model['s'],
                                moneyController.text,
                                model['a'].toString(),
                                moneyController.text);
                            Get.back();
                            moneyController.clear();
                            // CustomWidget().customToast('Order Placed');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color(0XFF0E9E21)),
                        child: const Text(
                          'Buy',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          if (moneyController.text.isEmpty) {
                            CustomWidget().customSnackBar(
                                message: 'Please enter the amount');
                          } else {
                            Get.find<DashboardController>().sell(
                                model['s'],
                                moneyController.text,
                                model['a'],
                                moneyController.text);
                            Get.back();
                            moneyController.clear();
                            // CustomWidget().customToast('Order Placed');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color(0XFF9E0E0E)),
                        child: const Text(
                          'Sell',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // ],
      ),
    );
  }
}
