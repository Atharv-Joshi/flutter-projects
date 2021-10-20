import 'package:flutter/material.dart';
import 'package:timer_on_steroids/widgets/custom_divider.dart';

class CustomDrawer extends StatelessWidget {
  Function resetValues;
  CustomDrawer({Key? key , required this.resetValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.5,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(50) , bottomRight:Radius.circular(50) ),
        child: Drawer(
          child: Container(
            color: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 100 , horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: (){resetValues();},
                    child:  Row(
                      children:  [
                        const Icon(
                          Icons.delete,
                          color: Colors.greenAccent,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'Reset All',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 1
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                const CustomDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
