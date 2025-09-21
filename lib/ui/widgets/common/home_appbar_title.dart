import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';
import 'package:stacked_tdd_app/ui/common/app_images.dart';
import 'package:stacked_tdd_app/ui/common/ui_helpers.dart';

class HomeAppbarTitleWidget extends StatelessWidget {
  const HomeAppbarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          verticalSpaceSmall,
          RichText(
            text: TextSpan(
              text: "Welcome, ",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: welcomeTextColor,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "User!",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(
            bellIcon,
            height: 24,
            width: 24,
          ),
        ]),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: brandBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        searchIcon,
                        height: 24,
                        width: 24,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "Search..",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: searchTextColor),
                      )
                    ],
                  ),
                ),
              ),
              horizontalSpaceTiny,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: addToCartFillColor,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Row(
                  children: [
                    Text(
                      "Scan Here",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    horizontalSpaceTiny,
                    Image.asset(
                      barcodeIcon,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
