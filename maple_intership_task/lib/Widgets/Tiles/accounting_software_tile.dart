import 'package:flutter/material.dart';
import 'package:maple_intership_task/Controllers/accounting_software_controller.dart';
import 'package:maple_intership_task/Controllers/channels_controller.dart';
import 'package:maple_intership_task/Controllers/personal_details_controller.dart';
import 'package:maple_intership_task/Controllers/uid_controller.dart';
import 'package:maple_intership_task/Screens/avatar_template_screen.dart';
import 'package:maple_intership_task/Services/database.dart';
import 'package:maple_intership_task/Widgets/PagePotential/tally_masters.dart';
import 'package:get/get.dart';

class AccountingSoftwareTile extends StatelessWidget {
  final image;
  final title;

  AccountingSoftwareTile(
      {
        required this.image,
        required this.title,
      }
      );

  final AccountingSoftwareController _accountingSoftwareController = Get.put(AccountingSoftwareController());
  final UIDController _uidController =Get.put(UIDController());
  final PersonalDetailsController _detailsController = Get.put(PersonalDetailsController());
  final ChannelsController _channelsController =Get.put(ChannelsController());



  @override
  Widget build(BuildContext context) {
    DatabaseService _databaseService = DatabaseService(uid: _uidController.uid.value);
    return Container(
      height: 97,
      width: 270,
      child: GestureDetector(
        onTap: (){
          _accountingSoftwareController.updateASoft(title);
          _databaseService.updateUserData(
              _detailsController.name.value,
              _detailsController.email.value,
              _detailsController.password.value,
              _channelsController.channel.value,
              title,
          );
          Get.to(() => AvatarTemplateScreen(child: TallyMasters()));
        },
        child: Image.asset(
          image,
        ),
      )
    );
  }
}
