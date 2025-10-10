import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            "By connecting your account, you confirm that you agree\nwith our ",
        style: TextStyles.b4.copyWith(color: ColorManger.grey),
        children: [
          TextSpan(
            text: "Terms and Conditions",
            style: TextStyles.b4.copyWith(
              color: ColorManger.black,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final url = Uri.parse("https://google.com");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
