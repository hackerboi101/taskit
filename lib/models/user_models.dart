class Users {
  String? id;
  String? userName;
  String? name;
  String? email;
  String? phoneNumber;
  String? avatar;
  bool? emailVisibility;
  bool? verified;

  Users({
    required this.id,
    required this.userName,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    required this.emailVisibility,
    required this.verified,
  });

  factory Users.fromPocketbase(Map<String, dynamic> data) {
    return Users(
      id: data['id'],
      userName: data['username'],
      name: data['name'],
      email: data['email'],
      phoneNumber: data['number'].toString(),
      avatar: data['avatar'] ?? '',
      emailVisibility: data['emailVisibility'],
      verified: data['verified'],
    );
  }
}
