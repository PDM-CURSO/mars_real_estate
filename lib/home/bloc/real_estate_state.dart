part of 'real_estate_bloc.dart';

sealed class RealEstateState extends Equatable {
  const RealEstateState();

  @override
  List<Object> get props => [];
}

final class RealEstateInitial extends RealEstateState {}

class LoadingState extends RealEstateState {}

class NotFoundState extends RealEstateState {}

class ErrorState extends RealEstateState {}

class SearchSuccessState extends RealEstateState {
  final List<Land> realEstateList;

  SearchSuccessState({required this.realEstateList});
  @override
  List<Object> get props => [realEstateList];
}
