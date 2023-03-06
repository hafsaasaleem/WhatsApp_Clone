// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/models/user_model.dart';
import '../../../common/routes/routes.dart';
import '../../../common/widgets/custom_icon_button.dart';
import '../../../common/widgets/last_seen_message.dart';
import '../../auth/controller/auth_controller.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back),
              Hero(
                tag: 'profile',
                child: Container(
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(user.profileImageUrl),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.profile, arguments: user);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.username,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                StreamBuilder(
                  stream: ref
                      .read(authControllerProvider)
                      .getUserPresenceStatus(uid: user.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return const Text(
                        "connecting",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      );
                    }
                    final singleUserModel = snapshot.data!;
                    final lastMessage =
                        lastSeenMessage(singleUserModel.lastSeen);
                    return Text(
                      singleUserModel.active
                          ? " Online"
                          : "last seen $lastMessage ago",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.videocam,
            iconSize: 24,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.call,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
