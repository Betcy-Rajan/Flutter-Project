import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/utilis/constants/colors.dart';
import 'package:store/utilis/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: TSizes.defaultSpace),
        Text(text,
        style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: TSizes.defaultSpace),

       showAction ? SizedBox(
        width: 200,
        child: OutlinedButton(onPressed: onActionPressed, style:  OutlinedButton.styleFrom(
          backgroundColor: TColors.dark),
          child: Text(actionText!, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),

          
        )),
       )
        : const SizedBox(),
      ],
    );
  }
}