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
  List<Land> _realEstateFilteredList = [];
  List<Land> _realEstateForSaleList = [];
  List<Land> _realEstateForRentList = [];

  RealEstateBloc() : super(RealEstateInitial()) {
    on<GetAllLandEvent>((event, emit) async {
      emit(LoadingState());
      if (await _getRealEstate())
        emit(SearchSuccessState(realEstateList: _realEstateList));
      else
        emit(ErrorState());
    });
    on<GetLandForSaleEvent>((event, emit) async {
      emit(LoadingState());
      if (_realEstateList.length == 0) {
        if (await _getRealEstate()) {
          _filterForSale();
          emit(SearchSuccessState(realEstateList: _realEstateForSaleList));
        } else
          emit(ErrorState());
      } else {
        _filterForSale();
        emit(SearchSuccessState(realEstateList: _realEstateForSaleList));
      }
    });
    on<GetLandForRentEvent>((event, emit) async {
      emit(LoadingState());
      if (_realEstateList.length == 0) {
        if (await _getRealEstate()) {
          _filterForRent();
          emit(SearchSuccessState(realEstateList: _realEstateForRentList));
        } else
          emit(ErrorState());
      } else {
        _filterForRent();
        emit(SearchSuccessState(realEstateList: _realEstateForRentList));
      }
    });
    on<GetSearchResultsEvent>((event, emit) async {
      if (_searchController.text != "") {
        emit(LoadingState());
        _searchFilter();
        emit(SearchSuccessState(realEstateList: _realEstateFilteredList));
      }
    });
    on<ClearSearchFieldEvent>((event, emit) {
      _clearSearchField();
      emit(RealEstateInitial());
    });
  }
  void _filterForRent() async {
    _realEstateForRentList =
        _realEstateList.where((land) => land.type == "rent").toList();
  }

  void _filterForSale() {
    _realEstateForSaleList =
        _realEstateList.where((land) => land.type == "buy").toList();
  }

  void _searchFilter() {
    _realEstateFilteredList = _realEstateList.where((land) {
      return (land.id!.contains(_searchController.text) ||
          land.price!.toString().contains(_searchController.text) ||
          land.type!.contains(_searchController.text));
    }).toList();
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
