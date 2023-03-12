// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/chat/repository/chat_repository.dart';

import '../../../common/models/last_message_model.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<LastMessageModel>> getAllLastMessageModel() {
    return chatRepository.getAllLastMessageModel();
  }

  void sendTextMessage({
    required BuildContext context,
    required String textMessage,
    required String receiverId,
  }) {
    ref.read(userInfoAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
            context: context,
            textMessage: textMessage,
            receiverId: receiverId,
            senderData: value!,
          ),
        );
  }
}
