import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';
import 'package:stacked_tdd_app/ui/common/app_images.dart';
import 'package:stacked_tdd_app/ui/common/app_strings.dart';
import 'package:stacked_tdd_app/ui/common/ui_helpers.dart';
import 'package:stacked_tdd_app/ui/widgets/common/network_image.dart';

import 'collection_list_model.dart';

class CollectionList extends StackedView<CollectionListModel> {
  final Map<String, dynamic>? data;
  const CollectionList({super.key, required this.data});

  @override
  Widget builder(
    BuildContext context,
    CollectionListModel viewModel,
    Widget? child,
  ) {
    List list = data?["products"];
    String title = data?["name"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: 15, top: 24),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const Spacer(),
              Text(
                kViewAll,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    list.length,
                    (index) {
                      return Stack(
                        children: [
                          Container(
                            width: 165,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: brandBorderColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpaceSmall,
                                SizedBox(
                                  height: 115,
                                  child: Center(
                                    child: NetworkImageWidget(
                                        url: list[index]["image"]),
                                  ),
                                ),
                                verticalSpaceSmall,
                                Text(
                                  list[index]["name"],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                verticalSpaceSmall,
                                RichText(
                                  text: TextSpan(
                                    text: list[index]["currency"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: strickedPriceColor,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: list[index]["actual_price"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          text: list[index]["currency"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: list[index]["price"],
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      list[index]["unit"],
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: unitColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                verticalSpaceSmall,
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 34,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 9),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: brandBorderColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(44),
                                          ),
                                          child: Text(kRfq,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                  color: rfqTextColor)),
                                        ),
                                        horizontalSpaceTiny,
                                        Expanded(
                                          child: Container(
                                            height: 34,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: addToCartFillColor,
                                              borderRadius:
                                                  BorderRadius.circular(44),
                                            ),
                                            child: Text(
                                              kAddToCart,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: const BoxDecoration(
                                color: offerBannerFillColor,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                list[index]["offer"],
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: offerTextColor),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onDoubleTap: () {},
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  heartIcon,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )),
            ),
          ),
        ),
      ],
    );
  }

  @override
  CollectionListModel viewModelBuilder(
    BuildContext context,
  ) =>
      CollectionListModel();
}
