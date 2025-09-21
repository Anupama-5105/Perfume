import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';
import 'package:stacked_tdd_app/ui/widgets/common/banner_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/collection_list/collection_list.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: viewModel.isBusy
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 6,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var section in viewModel.data ?? [])
                        _buildDynamicWidget(section),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildDynamicWidget(section) {
    switch (section?.type) {
      case "banner":
        return BannerWidget(data: section?.data);
      case "collection":
        return Text("collection");
      case "carousel":
        return _buildCarousel(section?.data ?? {});
        return Text("crsl");
      case "brands":
        return _buildBrandList(section?.data ?? {});
      case "category":
        return _buildCategoryList(section?.data ?? {});
      case "rfq":
        return _buildRfq(section?.data ?? {});
      case "future-order":
        return Text("future-order");
      case "banner-grid":
        return Text("banner-grid");

      default:
        return const SizedBox.shrink(); // empty for unknown type
    }
  }

  Widget _buildCarousel(data) {
    List list = data["carousel_items"];
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
      items: list.map((item) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item["image"],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 100,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBrandList(data) {
    List list = data["brands"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: 15, top: 24),
          child: Row(
            children: [
              Text(
                "Shop By Brands",
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
                    child: Image.network(
                      list[index]["image"],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 100,
                      ),
                    ),
                  ),
                );
              },
            )),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList(data) {
    List colorList = [
      categoryBgColor1,
      categoryBgColor2,
      categoryBgColor3,
      categoryBgColor4
    ];

    List list = data["categories"];
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

  Widget _buildRfq(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data?['image'] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 15,
            child: Text(
              "Request for quote",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Positioned(
              top: 72,
              left: 18,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: Text("Create RFQ",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))))
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
