import 'package:flutter/material.dart';
import 'package:mars_real_estate/models/land.dart';

class ItemLand extends StatelessWidget {
  final Land terrain;
  ItemLand({super.key, required this.terrain});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 150,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.network(
                terrain.imgSrc!,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(238, 161, 65, 216),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(15)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Id:${terrain.id}",
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                    Text(
                      "Price:\$${terrain.price}",
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
