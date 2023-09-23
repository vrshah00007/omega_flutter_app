import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:omega_flutter_app/utils/color_const.dart';

class InvestDetailWidget extends StatelessWidget {
  String? leadingTitle;
  String? trailingTitle;
  Widget? iconWidget;

  InvestDetailWidget({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
  this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Stack(
        children: [
          Container(
            height: 66,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 1, right: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SvgPicture.asset('assets/profile_detail_icon/🦆 icon _document text_.svg',height: 20,),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(leadingTitle ?? "",style: TextStyle(color: greyTextColor),),
                          const SizedBox(width: 12,),
                          Text(trailingTitle ?? "",style: TextStyle(fontWeight: FontWeight.w600),),

                        ],
                      ),



                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // SizedBox(width:Get.width*.4,),
                      if(SizedBox != null)
                        iconWidget ?? SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
