import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:mars_real_estate/home/item_land.dart';

import '../models/land.dart';
import 'bloc/real_estate_bloc.dart';

class RealEstateContent extends StatelessWidget {
  RealEstateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealEstateBloc, RealEstateState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return _loadingStateWidget();
        } else if (state is NotFoundState) {
          return _notFoundStateWidget();
        } else if (state is ErrorState) {
          return _errorStateWidget();
        } else if (state is SearchSuccessState) {
          return _searchResultsStateWidget(state.realEstateList);
        } else {
          return _defaultStateWidget();
        }
      },
    );
  }

  Widget _defaultStateWidget() {
    return Text("Type to search for results.");
  }

  Widget _notFoundStateWidget() {
    return Text("0 results found.");
  }

  Widget _errorStateWidget() {
    return Text("There was an error, try again later.");
  }

  Widget _loadingStateWidget() {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return VideoShimmer(
          isPurplishMode: true,
          hasBottomBox: true,
          isDarkMode: false,
        );
      },
    );
  }

  Widget _searchResultsStateWidget(List<Land> results) {
    return Column(
      children: [
        Text("${results.length} results found."),
        SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemLand(terrain: results[index]);
            },
          ),
        ),
      ],
    );
  }
}
