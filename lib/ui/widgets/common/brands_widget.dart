import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';
import 'package:stacked_tdd_app/ui/common/app_strings.dart';
import 'package:stacked_tdd_app/ui/widgets/common/network_image.dart';

class BrandsWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const BrandsWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List list = data?["brands"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: 15, top: 24),
          child: Row(
            children: [
              Text(
                kShopByBrands,
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
                children: List.generate(
              list.length,
              (index) {
                return Container(
                  height: 104,
                  width: 130,
                  margin: const EdgeInsets.symmetric(horizontal: 7.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: brandBorderColor,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Center(
                    child: NetworkImageWidget(url: list[index]["image"]),
                  ),
                );
              },
            )),
          ),
        ),
      ],
    );
  }
}
