import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_tdd_app/ui/common/app_colors.dart';
import 'package:stacked_tdd_app/ui/widgets/common/banner_grid_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/banner_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/brands_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/carousel_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/category_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/collection_list/collection_list.dart';
import 'package:stacked_tdd_app/ui/widgets/common/future_order_widget.dart';
import 'package:stacked_tdd_app/ui/widgets/common/home_appbar_title.dart';
import 'package:stacked_tdd_app/ui/widgets/common/rfq_widget.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const HomeAppbarTitleWidget(),
      ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0)
                        .copyWith(bottom: 50),
                    child: Column(
                      children: [
                        for (var section in viewModel.data ?? [])
                          _buildDynamicWidget(section),
                      ],
                    ),
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
        return CollectionList(data: section?.data ?? {});
      case "carousel":
        return CarouselWidget(data: section?.data ?? {});
      case "brands":
        return BrandsWidget(data: section?.data ?? {});
      case "category":
        return CategoryWidget(data: section?.data ?? {});
      case "rfq":
        return RfqWidget(data: section?.data ?? {});
      case "future-order":
        return FutureOrderWidget(data: section?.data ?? {});
      case "banner-grid":
        return BannerGridWidget(data: section?.data ?? {});

      default:
        return const SizedBox.shrink(); // empty for unknown type
    }
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
