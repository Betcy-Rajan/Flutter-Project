import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:iconsax/iconsax.dart';
import 'package:store/features/shop/screens/home/home.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/helpers/helper_functions.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});


  @override
  Widget build(BuildContext context) {
    
    final  controller = Get.put(NavigationMenuController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: controller.updateIndex,
        backgroundColor: darkMode ? Colors.black : Colors.white,
        indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
        destinations: const  [
           NavigationDestination(icon: Icon(Iconsax.home),label: 'Home',),
           NavigationDestination(icon: Icon(Iconsax.shop),label: 'Home',),
           NavigationDestination(icon: Icon(Iconsax.heart),label: 'Home',),
           NavigationDestination(icon: Icon(Iconsax.user),label: 'Home',),
        ]
      )),
      body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}
class NavigationMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final screens = [const HomeScreen(),Container(color: Colors.green,),Container(color: Colors.purple,),Container(color: Colors.yellow,)];
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

}