import 'dart:convert';

import 'package:equatable/equatable.dart';

class Land extends Equatable {
  final int? price;
  final String? id;
  final String? type;
  final String? imgSrc;

  const Land({this.price, this.id, this.type, this.imgSrc});

  factory Land.fromMap(Map<String, dynamic> data) => Land(
        price: data['price'] as int?,
        id: data['id'] as String?,
        type: data['type'] as String?,
        imgSrc: data['img_src'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'price': price,
        'id': id,
        'type': type,
        'img_src': imgSrc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Land].
  factory Land.fromJson(String data) {
    return Land.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Land] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [price, id, type, imgSrc];
}
