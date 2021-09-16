
class Launch {
  final String name;
  final bool? launchSuccess;

  Launch(this.name, this.launchSuccess);

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(json['mission_name'], json["launch_success"]);
  }
}