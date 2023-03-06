import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import '../../../common/colors/coloors.dart';
import '../../../common/widgets/custom_icon_button.dart';
import '../components/custom_text_field.dart';
import '../controller/auth_controller.dart';

class VerificationPage extends ConsumerWidget {
  final String smsCodeId;
  final String phoneNumber;
  const VerificationPage({
    Key? key,
    required this.smsCodeId,
    required this.phoneNumber,
  }) : super(key: key);

  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          "Verifying your number",
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(onTap: () {}, icon: Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      text:
                          "Waiting to automatically detact an SMS sent to +923133033215. ",
                    ),
                    TextSpan(
                      text: "Wrong number?",
                      style: TextStyle(
                        fontSize: 15,
                        color: context.theme.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextfield(
                hintText: "- - -  - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if(value.length == 6){
                    return verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Enter 6-digit code",
              style: TextStyle(
                fontSize: 14,
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => showBottomSheet(context),
              child: const Text(
                "Didn't receive code?",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: Coloors.greyDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIconButton(
                onTap: () => Navigator.of(context).pop(),
                icon: Icons.close_outlined,
                iconSize: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Coloors.greenLight,
                      ),
                      child: const Icon(
                        Icons.message_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Didn't receive a verification code?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      "Please check your SMS messages before requesting another code.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Coloors.greyLight,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade50.withOpacity(0.6),
                        padding: const EdgeInsets.all(12),
                        minimumSize: const Size.fromHeight(20),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.message, color: Colors.grey),
                      label: const Text(
                        "RESEND SMS 1:30",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          width: 2,
                          color: Colors.blue.shade50.withOpacity(0.6),
                        ),
                        padding: const EdgeInsets.all(12),
                        minimumSize: const Size.fromHeight(20),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.phone, color: Colors.grey),
                      label: const Text(
                        "CALL ME 1:30",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
