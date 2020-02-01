import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsEvent extends NewsEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
