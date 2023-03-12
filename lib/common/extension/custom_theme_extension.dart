// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors/coloors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;
  final Color? profilePageBgColor;
  final Color? chatTextFieldBgColor;
  final Color? chatPageBgColor;
  final Color? chatPageDoodleColor;

  const CustomThemeExtension({
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
    this.authAppbarTextColor,
    this.photoIconBgColor,
    this.photoIconColor,
    this.profilePageBgColor,
    this.chatTextFieldBgColor,
    this.chatPageBgColor,
    this.chatPageDoodleColor,
  });

  static const lightMode = CustomThemeExtension(
    circleImageColor: Color(0xFF25D366),
    greyColor: Coloors.greyLight,
    blueColor: Coloors.blueLight,
    langBtnBgColor: Color(0xFFF7F8FA),
    langBtnHighlightColor: Color(0xFFE8E8ED),
    authAppbarTextColor: Coloors.greenLight,
    photoIconBgColor: Color(0xFFF0F2F3),
    photoIconColor: Color(0xFF9DAAB3),
    profilePageBgColor: Color(0xFFF7F8FA),
    chatTextFieldBgColor: Colors.white,
    chatPageBgColor: Color(0xFFEFE7DE),
    chatPageDoodleColor: Colors.white70,
  );

  static const darkMode = CustomThemeExtension(
    circleImageColor: Coloors.greenDark,
    greyColor: Coloors.greyDark,
    blueColor: Coloors.blueDark,
    langBtnBgColor: Color(0xFF182229),
    langBtnHighlightColor: Color(0xFF09141A),
    authAppbarTextColor: Color(0xFFE9EDEF),
    photoIconBgColor: Color(0xFF283339),
    photoIconColor: Color(0xFF61717B),
    profilePageBgColor: Color(0xFF0B141A),
    chatTextFieldBgColor: Coloors.greyBackground,
    chatPageBgColor: Color(0xFF081419),
    chatPageDoodleColor: Color(0xFF172428),
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
    Color? profilePageBgColor,
    Color? chatTextFieldBgColor,
    Color? chatPageBgColor,
    Color? chatPageDoodleColor,    

  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      blueColor: blueColor ?? this.blueColor,
      greyColor: greyColor ?? this.greyColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor:
          langBtnHighlightColor ?? this.langBtnHighlightColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
      profilePageBgColor: profilePageBgColor ?? this.profilePageBgColor,
      chatTextFieldBgColor: chatTextFieldBgColor ?? this.chatTextFieldBgColor,
      chatPageBgColor: chatPageBgColor ?? this.chatPageBgColor,
      chatPageDoodleColor: chatPageDoodleColor ?? this.chatPageDoodleColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighlightColor:
          Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      profilePageBgColor:
          Color.lerp(profilePageBgColor, other.profilePageBgColor, t),
      chatTextFieldBgColor:
          Color.lerp(chatTextFieldBgColor, other.chatTextFieldBgColor, t),
      chatPageBgColor: Color.lerp(chatPageBgColor, other.chatPageBgColor, t),
      chatPageDoodleColor: Color.lerp(chatPageDoodleColor, other.chatPageDoodleColor, t),
          
          

    );
  }
}
