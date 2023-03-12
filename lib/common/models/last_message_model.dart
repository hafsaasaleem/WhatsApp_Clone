class LastMessageModel {
  final String username;
  final String profileImageUrl;
  final String contactId;
  final DateTime timeSent;
  final String lastMessage;
  LastMessageModel({
    required this.username,
    required this.profileImageUrl,
    required this.contactId,
    required this.timeSent,
    required this.lastMessage,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'receiprofileImageUrlverId': profileImageUrl,
      'contactId': contactId,
      'lastMessage': lastMessage,
      'timeSent': timeSent.millisecondsSinceEpoch,
    };
  }

  factory LastMessageModel.fromMap(Map<String, dynamic> map) {
    return LastMessageModel(
      username: map['username'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      contactId: map['contactId'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
    );
  }
}
