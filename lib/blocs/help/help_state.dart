import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HelpState extends Equatable {
  @override
  List<Object> get props => [];
}

class HelpUninitialized extends HelpState {}

class HelpLoading extends HelpState {}

class HelpLoaded extends HelpState {
  final String htmlData;

  HelpLoaded({@required this.htmlData}) : assert(htmlData != null);
}
