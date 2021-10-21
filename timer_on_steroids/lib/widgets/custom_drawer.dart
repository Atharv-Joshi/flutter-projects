import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:timer_on_steroids/widgets/custom_divider.dart';

class CustomDrawer extends StatelessWidget {
  Function resetValues;
  CustomDrawer({Key? key , required this.resetValues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.5,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(50) , bottomRight:Radius.circular(50) ),
        child: Drawer(
          child: Container(
            color: theme.primaryColorDark,
            padding: const EdgeInsets.symmetric(vertical: 100 , horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: (){resetValues();},
                    child:  Row(
                      children:  [
                         Icon(
                          Icons.delete,
                          color: theme.iconTheme.color,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child:  Text(
                            'Reset All',
                            style: theme.textTheme.bodyText2,
                          ),
                        ),
                      ],
                    )
                ),
                const CustomDivider(),
                TextButton(
                    onPressed: (){
                  var themeId = DynamicTheme.of(context)!.themeId;
                  if(themeId == 0){
                    themeId = 1;
                  }
                  else{
                    themeId = 0;
                  }
                  DynamicTheme.of(context)!.setTheme(themeId);
                }, child: Row(
                  children: [
                    DynamicTheme.of(context)!.themeId == 0 ?  Icon(Icons.toggle_off,color: theme.iconTheme.color, ) :  Icon(Icons.toggle_on,color: theme.iconTheme.color,),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Toggle Theme',
                        style: theme.textTheme.bodyText2,
                        ),
                    ),
                  ],
                )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
