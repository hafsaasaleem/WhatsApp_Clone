import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import '../../../common/colors/coloors.dart';
import '../../../common/utils/dialogs/show_alert_dialog.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../components/custom_text_field.dart';
import '../controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ["PK"],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
        flagSize: 22,
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const BackButton(color: Coloors.greyDark),
          // prefixIcon: const Icon(
          //   Icons.language,
          //   color: Coloors.greenDark,
          // ),
          suffixIcon: const Icon(Icons.search),
          hintStyle: const TextStyle(
            color: Coloors.greenDark,
            fontWeight: FontWeight.w500,
          ),
          hintText: "Choose a country",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Coloors.greenDark),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please enter your phone number.",
      );
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              "The phone number you entered is too short for the country: $countryName\n\nInclude your area code if you haven't.");
    } else if (phoneNumber.length > 10) {
      return showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for the country: $countryName.",
      );
    }

    ref.read(authControllerProvider).sendSmsCode(
          context: context,
          phoneNumber: '+$countryCode$phoneNumber',
        );
  }

  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    countryNameController = TextEditingController(text: "Pakistan");
    countryCodeController = TextEditingController(text: "92");
    phoneNumberController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: context.theme.authAppbarTextColor,
          ),
        ),
        actions: [
          PopupMenuButton(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            icon: const Icon(
              Icons.more_vert,
              color: Coloors.greenDark,
            ),
            itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  height: 80,
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 12,
                  // ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Help"),
                      SizedBox(height: 16),
                      Text("Link a device"),
                    ],
                  ),
                ),
              ];
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "WhatsApp will need to verify your phone number. ",
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    ),
                  ]),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextfield(
              onTap: showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextfield(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextfield(
                    controller: phoneNumberController,
                    hintText: "phone number",
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Carrier charges may apply",
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPress: sendCodeToPhone,
        text: "NEXT",
        buttonWidth: 90,
      ),
    );
  }
}
