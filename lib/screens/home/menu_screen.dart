import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/res/themes/app_color.dart';
import 'package:study_app/res/themes/app_light_theme.dart';
import 'package:study_app/res/themes/ui_parameters.dart';

import '../../controllers/zoom_drawer_controller.dart';
import '../../res/themes/app_dark_theme.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenpadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
       color: Get.isDarkMode?primaryDarkColordark: primaryLightColorLight,
      ),
      child: Theme(
        data: ThemeData(textButtonTheme:
          TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor )
          )
        ),
        child: SafeArea(child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,

              child: BackButton(
              color: Colors.white,
              onPressed: () {
                controller.toogleDrawer();
              },
            )),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.amber,
                ),

                
                Obx(() => controller.user.value==null?
                  SizedBox():
                  Text(
                    controller.user.value!.displayName??'',
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,color: onSurfaceTextColor),
                  )
                ),

                _DrawerButton(icon: Icons.web, label: "website",onPressed: () => controller.website(),),
                _DrawerButton(icon: Icons.web, label: "Github",onPressed: () => controller.github(),),
                _DrawerButton(icon: Icons.facebook, label: "facebook",onPressed: () => controller.facebook(),),
                Spacer(flex: 4,),
                _DrawerButton(icon: Icons.logout, label: "Logout",onPressed: () => controller.signOut(),)
              ],
            ),

          ],
        ))
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({super.key, required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed:  onPressed, 
      icon: Icon(
        icon,
        size: 15,
      ) ,
      label: Text(label),
    );
  }
}