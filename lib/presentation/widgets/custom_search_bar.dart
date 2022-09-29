import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key,
      required this.controller,
      required this.onQueryChanged,
      required this.builder});

  final FloatingSearchBarController controller;
  final OnQueryChangedCallback onQueryChanged;
  final FloatingSearchBarBuilder builder;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      controller: controller,
      clearQueryOnClose: true,
      hint: 'search...',
      iconColor: Colors.grey,
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOutCubic,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      actions: [
        FloatingSearchBarAction(
            showIfOpened: false,
            child: Icon(Icons.place, color: Colors.black.withOpacity(0.6))),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      // progress: model.isLoading,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: onQueryChanged,
      onFocusChanged: (_) {},
      scrollPadding: EdgeInsets.zero,
      transition: CircularFloatingSearchBarTransition(spacing: 16),
      builder: builder,
    );
  }
}
