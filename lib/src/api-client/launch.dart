
class Launch {
  final String name;
  final int flightNumber;

  Launch(this.name, this.flightNumber);

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(json['mission_name'], json["flight_number"]);
  }
}