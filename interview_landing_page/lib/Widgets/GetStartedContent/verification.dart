import 'package:flutter/material.dart';
import 'package:interview_landing_page/constants/text/landing_page_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: getValueForScreenType<double>(
              context: context,
              mobile: 281,
              desktop: 538,
            ),
            height: getValueForScreenType<double>(
              context: context,
              mobile: 73,
              desktop: 169,
            ),
            child: Text(
              'VERIFICATION MADE EASY',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontSize: 60,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 24,
                    desktop: 60,
                  ),
                  color: Colors.white
              ),
            ),
          ),
          Container(
            width: getValueForScreenType<double>(
          context: context,
          mobile: 353,
          desktop: 570,
          ),
            height: getValueForScreenType<double>(
              context: context,
              mobile: 198,
              desktop: 172,
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                fontSize: getValueForScreenType<double>(
                  context: context,
                  mobile: 12,
                  desktop: 16,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: getValueForScreenType<double>(
                      context: context,
                      mobile: 102.35,
                      desktop: 191.9,
                    ),
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/appStore2x.png',
                    )
                ),
                IconButton(
                    iconSize: getValueForScreenType<double>(
                      context: context,
                      mobile: 137.76,
                      desktop: 247.05,
                    ),
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/playStore.png',
                    ))
              ],
            ),
          ),
        ],
      )
    );
  }
}
