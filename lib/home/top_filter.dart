import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_real_estate/home/bloc/real_estate_bloc.dart';

class TopFilter extends StatelessWidget {
  TopFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: BlocProvider.of<RealEstateBloc>(context).getSearchCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Tap to search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<RealEstateBloc>(context)
                      .add(ClearSearchFieldEvent());
                },
                icon: Icon(Icons.clear),
              ),
            ),
            onChanged: (content) {
              BlocProvider.of<RealEstateBloc>(context)
                  .add(GetSearchResultsEvent());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("All"),
                onPressed: () {
                  BlocProvider.of<RealEstateBloc>(context)
                      .add(GetAllLandEvent());
                },
              ),
              ElevatedButton(
                child: Text("Buy"),
                onPressed: () {
                  BlocProvider.of<RealEstateBloc>(context)
                      .add(GetLandForSaleEvent());
                },
              ),
              ElevatedButton(
                child: Text("Rent"),
                onPressed: () {
                  BlocProvider.of<RealEstateBloc>(context)
                      .add(GetLandForRentEvent());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
