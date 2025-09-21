import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final Map<String, dynamic>? data;
  const CategoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List colorList = [
      categoryBgColor1,
      categoryBgColor2,
      categoryBgColor3,
      categoryBgColor4
    ];

    List list = data?["categories"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: 15, top: 24),
          child: Row(
            children: [
              Text(
                "Our Categories ",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const Spacer(),
              Text(
                "View All",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  list.length,
                  (index) {
                    return Container(
                      width: 72,
                      margin: const EdgeInsets.symmetric(horizontal: 7.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colorList[index % colorList.length],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: brandBorderColor,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Center(
                              child: Image.network(
                                list[index]["image"],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.broken_image,
                                  size: 100,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            list[index]["name"],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
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
