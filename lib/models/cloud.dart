import 'package:equatable/equatable.dart';

/// Cloud
class Cloud extends Equatable {
  double cloudinessPercentage;

  @override
  List<Object> get props => [cloudinessPercentage];

  Cloud({this.cloudinessPercentage});

  factory Cloud.fromJson(Map<String, dynamic> data) {
    double cloudinessPercentage = double.parse((data['all'] ?? 0.0).toString());
    return Cloud(cloudinessPercentage: cloudinessPercentage);
  }
}
