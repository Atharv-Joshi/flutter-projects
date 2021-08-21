import 'package:flutter/material.dart';
import 'package:maple_intership_task/Controllers/channels_controller.dart';
import 'package:maple_intership_task/Screens/avatar_template_screen.dart';
import 'package:maple_intership_task/Widgets/PagePotential/accounting_software.dart';
import 'package:get/get.dart';

class ConnectButton extends StatelessWidget {
  final title;

  ConnectButton(
  {
    required this.title,
}
      );

  final ChannelsController _channelsController = Get.put(ChannelsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 51,
      child: ElevatedButton(
        onPressed: (){
            _channelsController.updateChannel(title);
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => AvatarTemplateScreen(child: AccountingSoftware())));
        },
        child: Text(
          'Connect',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
