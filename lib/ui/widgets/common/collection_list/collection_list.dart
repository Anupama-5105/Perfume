import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'collection_list_model.dart';

class CollectionList extends StackedView<CollectionListModel> {
  const CollectionList({super.key});

  @override
  Widget builder(
    BuildContext context,
    CollectionListModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CollectionListModel viewModelBuilder(
    BuildContext context,
  ) =>
      CollectionListModel();
}
