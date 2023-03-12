import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import '../../../common/colors/coloors.dart';
import '../../../common/models/user_model.dart';
import '../../../common/widgets/custom_icon_button.dart';
import '../../../common/widgets/last_seen_message.dart';
import '../widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.profilePageBgColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistentDelegate(user),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                          color: context.theme.greyColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'last seen ${lastSeenMessage(user.lastSeen)} ago',
                        style: TextStyle(color: context.theme.greyColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconWithText(icon: Icons.call, text: "Audio"),
                          iconWithText(icon: Icons.video_call, text: "Video"),
                          iconWithText(icon: Icons.search, text: "Search"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  title: const Text("Hey there! I am using WhatsApp"),
                  subtitle: Text(
                    "6th March",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomListTile(
                  leading: Icons.notifications,
                  title: 'Mute notifications',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                const CustomListTile(
                  leading: Icons.music_note,
                  title: 'Custom notifications',
                ),
                const CustomListTile(
                  leading: Icons.photo,
                  title: 'Media visibility',
                ),
                const SizedBox(height: 20),
                const CustomListTile(
                  leading: Icons.lock,
                  title: 'Encryption',
                  subtitle:
                      'Messages and calls are end-to-end encrypted. Tap to verify.',
                ),
                const CustomListTile(
                  leading: Icons.timer,
                  title: 'Disappearing messages',
                  subtitle: 'Off',
                ),
                const SizedBox(height: 20),
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  leading: CustomIconButton(
                    onTap: () {},
                    icon: Icons.group,
                    background: Coloors.greenDark,
                    iconColor: Colors.white,
                  ),
                  title: Text("Create group with ${user.username}"),
                ),
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25, right: 10),
                  leading: CustomIconButton(
                    onTap: () {},
                    icon: Icons.block,
                    iconColor: const Color(0xFFF15C6D),
                  ),
                  title: Text(
                    "Block ${user.username}",
                    style: const TextStyle(
                      color: Color(0xFFF15C6D),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25, right: 10),
                  leading: CustomIconButton(
                    onTap: () {},
                    icon: Icons.thumb_down,
                    iconColor: const Color(0xFFF15C6D),
                  ),
                  title: Text(
                    "Report ${user.username}",
                    style: const TextStyle(
                      color: Color(0xFFF15C6D),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  iconWithText({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Coloors.greenDark),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Coloors.greenDark),
          ),
        ],
      ),
    );
  }
}

class SliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final UserModel user;
  final double maxHeaderHeight = 180;
  final double minHeadereight = kToolbarHeight + 20;
  final double maxImageSize = 113;
  final double minImageSize = 35;

  SliverPersistentDelegate(this.user);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / (maxHeaderHeight - 35);
    final percent2 = shrinkOffset / (maxHeaderHeight);
    final currentImageSize = (maxImageSize * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    final currentImagePosition = ((size.width / 2 - 65) * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        color: Theme.of(context)
            .appBarTheme
            .backgroundColor!
            .withOpacity(percent2 * 2 < 1 ? percent2 * 2 : 1),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 15,
              left: currentImagePosition + 50,
              child: Text(
                user.username,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(percent2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: BackButton(
                color:
                    percent2 > .3 ? Colors.white.withOpacity(percent2) : null,
              ),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: CustomIconButton(
                onTap: () {},
                icon: Icons.more_vert,
                iconColor: percent2 > .3
                    ? Colors.white.withOpacity(percent2)
                    : Theme.of(context).textTheme.bodyText2!.color,
              ),
            ),
            Positioned(
              left: currentImagePosition + 5,
              top: MediaQuery.of(context).viewPadding.top + 5,
              bottom: 0,
              child: Hero(
                tag: 'profile',
                child: Container(
                  width: currentImageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(user.profileImageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeaderHeight;

  @override
  double get minExtent => minHeadereight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
