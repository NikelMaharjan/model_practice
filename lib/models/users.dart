
class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json){
    return Geo(
        lat: json['lat'],
        lng: json['lng']);
  }
}

class Address {
  final String street;
  final String city;
  final Geo geo;

  Address({required this.street, required this.city, required this.geo});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
        street: json['street'],
        city: json['city'],
        geo: Geo.fromJson(json['geo']));
  }
}

class Company {
  final String name;
  final String bs;

  Company({required this.name, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
        name: json['name'],
        bs: json['bs']);
  }
}



class UserDetail {
  final int id;
  final String name;
  final String email;
  final Address address;
  final Company company;

  UserDetail({required this.id, required this.name, required this.email, required this.address, required this.company});

  factory UserDetail.fromJson(Map<String, dynamic> json){
    return UserDetail(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']));
  }


}