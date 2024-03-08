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
            // TODO: descomentar eso:
            // controller: BlocProvider.of<RealEstateBloc>(context).getSearchCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Tap to search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  // TODO: Add clear search event to the bloc
                },
                icon: Icon(Icons.clear),
              ),
            ),
            onChanged: (content) {
              // TODO: add search event to the BLoC
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("All"),
                onPressed: () {
                  // TODO: Add get all land event to the bloc
                },
              ),
              ElevatedButton(
                child: Text("Buy"),
                onPressed: () {
                  // TODO: Add get land for sale event to the bloc
                },
              ),
              ElevatedButton(
                child: Text("Rent"),
                onPressed: () {
                  // TODO: Add get land for rent to the bloc
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
