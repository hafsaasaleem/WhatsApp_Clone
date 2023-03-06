// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final String uid;
  final String profileImageUrl;
  final String phoneNumber;
  final bool active;
  final List<String> groupId;
  final int lastSeen;
  UserModel({
    required this.username,
    required this.uid,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.active,
    required this.groupId,
    required this.lastSeen,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'userid': uid,
      'profileImageUrl': profileImageUrl,
      'phoneNumber': phoneNumber,
      'active': active,
      'groupId': groupId,
      'lastSeen' : lastSeen,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'] ?? "",
        uid: map['userid'] ?? "",
        profileImageUrl: map['profileImageUrl'] ?? "",
        phoneNumber: map['phoneNumber'] ?? "",
        lastSeen : map['lastSeen'] ?? 0,
        active: map['active'] ?? false,
        groupId: List<String>.from(
          (map['groupId']),
        ));
  }
}
