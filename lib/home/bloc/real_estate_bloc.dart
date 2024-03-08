import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/land.dart';

part 'real_estate_event.dart';
part 'real_estate_state.dart';

class RealEstateBloc extends Bloc<RealEstateEvent, RealEstateState> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController get getSearchCtrl => _searchController;
  String _realEstateEndpoint =
      "https://android-kotlin-fun-mars-server.appspot.com/realestate";
  List<Land> _realEstateList = [];

  RealEstateBloc() : super(RealEstateInitial()) {
    on<GetAllLandEvent>((event, emit) async {
      // TODO: implement method
    });
    on<GetLandForSaleEvent>((event, emit) async {
      // TODO: implement method
    });
    on<GetLandForRentEvent>((event, emit) async {
      // TODO: implement method
    });
    on<GetSearchResultsEvent>((event, emit) async {
      // TODO: implement method
    });
    on<ClearSearchFieldEvent>((event, emit) {
      _clearSearchField();
      emit(RealEstateInitial());
    });
  }
  void _filterForRent() async {
    // TODO: implement method
  }

  void _filterForSale() {
    // TODO: implement method
  }

  void _searchFilter() {
    // TODO: implement method
  }

  Future<bool> _getRealEstate() async {
    try {
      var res = await get(Uri.parse(_realEstateEndpoint));
      if (res.statusCode == 200) {
        _realEstateList =
            (jsonDecode(res.body) as List).map((e) => Land.fromMap(e)).toList();
      }
      return true;
    } catch (e) {
      print("Error al descargar: $e");
      return false;
    }
  }

  void _clearSearchField() {
    _searchController.clear();
  }
}
