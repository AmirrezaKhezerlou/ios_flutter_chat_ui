import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_chat_ui/utils/consts.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppUtils.appPadding),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Mengobrol',style: Theme.of(context).textTheme.titleLarge,),
          SvgPicture.asset('assets/search.svg',width: AppUtils.svgSize,height: AppUtils.svgSize,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}
