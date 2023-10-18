import 'dart:convert';

class Users{
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  Users({required this.id, required this.name, required this.email, required this.password, required this.address, required this.type, required this.token});
  Map<String,dynamic> toMap(){
    return {
      '_id' : id,
      'Name': name,
      'Email' : email,
      'Password': password,
      'Address': address,
      'Type': type,
      'jsonwebtoken': token,
    };
  }
  factory Users.fromMap(Map<String,dynamic> map){
    return Users(
      id: map['_id'] ?? '',
      name: map['Name'] ?? '',
      email: map['Email'] ?? '',
      password: map['Password'] ?? '',
      address: map['Address'] ?? '',
      token: map['jsonwebtoken'] ?? '',
      type: map['Type'] ?? '', 
    );
  }
  String toJson() => json.encode(toMap());
  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

   Users copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token
    );
  }
}