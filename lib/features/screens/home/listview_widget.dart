import 'package:flutter/material.dart';
import 'package:news/core/utiles/app_colors.dart';
import 'package:news/l10n/app_localizations.dart';

class ListviewWidget extends StatelessWidget {
  final List<String> images;
  const ListviewWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return  ListView.builder(itemCount: images.length,itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Container(
              height: 198.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(image: AssetImage(images[index])),
              ),
            ),
            Positioned(
              bottom: 16,
              right: index%2==0 ? 16:176,
              child: Directionality(
                textDirection: index%2==0 ? TextDirection.ltr:TextDirection.rtl,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(88),
                      color: AppColors.grey
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16,),
                      Text(locale.viewAll,style: theme.textTheme.bodyMedium,),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.black,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: theme.primaryColor,size: 20,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
