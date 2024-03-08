part of 'real_estate_bloc.dart';

sealed class RealEstateEvent extends Equatable {
  const RealEstateEvent();

  @override
  List<Object> get props => [];
}

class GetAllLandEvent extends RealEstateEvent {}

class GetLandForSaleEvent extends RealEstateEvent {}

class GetLandForRentEvent extends RealEstateEvent {}

class GetSearchResultsEvent extends RealEstateEvent {}

class ClearSearchFieldEvent extends RealEstateEvent {}
