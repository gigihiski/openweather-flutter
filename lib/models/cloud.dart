/// Cloud
class Cloud {
  double cloudinessPercentage;

  Cloud({this.cloudinessPercentage});

  factory Cloud.fromJson(Map<String, dynamic> data) {
    double cloudinessPercentage = data['cloudinessPercentage'] as double;
    return Cloud(cloudinessPercentage: cloudinessPercentage);
  }
}
