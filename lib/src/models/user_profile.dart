class UserProfile {
  final String uid;
  final String name;
  final String email;
  final String location;

  UserProfile({required this.uid, required this.name, required this.email, required this.location});

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'email': email,
        'location': location,
      };

  factory UserProfile.fromMap(Map<String, dynamic> map) => UserProfile(
        uid: map['uid'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        location: map['location'] ?? '',
      );
}
