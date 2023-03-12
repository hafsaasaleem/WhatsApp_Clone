import '../enum/message_type.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String messageId;
  final String testMessage;
  final MessageType type;
  final DateTime timeSent;
  final bool isSeen;
  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.messageId,
    required this.testMessage,
    required this.type,
    required this.timeSent,
    required this.isSeen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'messageId': messageId,
      'testMessage': testMessage,
      'type': type.type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'isSeen': isSeen,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      messageId: map['messageId'],
      testMessage: map['testMessage'],
      type: (map['type'] as String).toEnum(),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      isSeen: map['isSeen'] ?? false,
    );
  }
}
