import 'package:flutter/material.dart';
import 'package:interview_landing_page/Widgets/GetStartedContent/verification.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GetStartedContentMobile extends StatelessWidget {
  const GetStartedContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
              Image.asset(
                'assets/bigLogo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 73,
              ),
              Verification(),
                IconButton(
                    iconSize: getValueForScreenType<double>(
                        context: context,
                        mobile: 30,
                        desktop: 52,
                    ),
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/downArrow.png',
                    ))
        ],
      ),
    );
  }
}
