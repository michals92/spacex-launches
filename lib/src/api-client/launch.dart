
class Launch {
  final String name;
  final int flightNumber;
  final String? imagePatch;

  Launch(this.name, this.flightNumber, this.imagePatch);

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(json['mission_name'], json["flight_number"], json["links"]["mission_patch"]);
  }
}