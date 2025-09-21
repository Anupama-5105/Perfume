import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'details_view_viewmodel.dart';

class DetailsViewView extends StackedView<DetailsViewViewModel> {
  const DetailsViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("DetailsViewView")),
      ),
    );
  }

  @override
  DetailsViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewViewModel();
}
