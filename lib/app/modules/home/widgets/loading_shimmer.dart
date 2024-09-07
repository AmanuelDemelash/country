
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constant/colorConstant.dart';

class loadingShimmer extends StatelessWidget {
  const loadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: ColorConstant.blueDark_50,
          child: Container(
            width: 60,
            height:80,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
            ),
          )
      ),
      title: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: ColorConstant.blueDark_50,
          child: Container(
            width: 50,
            height:8,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
            ),
          )
      ),
      subtitle: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: ColorConstant.blueDark_50,
          child: Container(
            width: 40,
            height:8,
            decoration: BoxDecoration(
                color:Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
            ),
          )
      ),
    );
  }
}
