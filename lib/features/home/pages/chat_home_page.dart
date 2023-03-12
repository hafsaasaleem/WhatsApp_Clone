import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/models/last_message_model.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';
import '../../../common/colors/coloors.dart';
import '../../../common/routes/routes.dart';

class ChatHomePage extends ConsumerWidget {
  const ChatHomePage({super.key});

  navigateToContactPage(context) {
    Navigator.pushNamed(context, Routes.contact);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<List<LastMessageModel>>(
        stream: ref.watch(chatControllerProvider).getAllLastMessageModel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Coloors.greenDark,
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final lastMessageData = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: CachedNetworkImageProvider(
                      lastMessageData.profileImageUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lastMessageData.username),
                    Text(
                      DateFormat.Hm().format(lastMessageData.timeSent),
                      style: TextStyle(
                        fontSize: 13,
                        color: context.theme.greyColor,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    lastMessageData.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToContactPage(context),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
