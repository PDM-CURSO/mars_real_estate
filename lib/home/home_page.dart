import 'package:flutter/material.dart';
import 'package:mars_real_estate/home/real_estate_content.dart';
import 'package:mars_real_estate/home/top_filter.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real estate'),
      ),
      body: Column(
        children: [
          TopFilter(),
          Expanded(child: RealEstateContent()),
        ],
      ),
    );
  }
}
