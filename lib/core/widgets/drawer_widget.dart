import 'package:flutter/material.dart';
import 'package:news/core/provider/app_provider.dart';
import 'package:news/core/utiles/app_assets.dart';
import 'package:news/core/utiles/app_colors.dart';
import 'package:news/core/utiles/app_text_styles.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}
class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    String  initTheme = "Light";

    var locale= AppLocalizations.of(context)!;
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166,
            color: AppColors.white,
            child: Center(child: Text(locale.appTitle,style: AppTextStyles.black24w700,)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16),
            child: Row(
              spacing: 8,
              children: [
                ImageIcon(AssetImage(AppAssets.icnHome),color: AppColors.white,),
                Text(locale.goToHome,style: AppTextStyles.white20w700,),
              ],
            ),
          ),
          Divider(color: AppColors.white,height: 50,thickness: 2,indent: 16,endIndent: 16,),
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16),
            child: Row(
              spacing: 8,
              children: [
                ImageIcon(AssetImage(AppAssets.icnTheme),color: AppColors.white,),
                Text(locale.theme,style: AppTextStyles.white20w700,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(value: initTheme,
                dropdownColor:Colors.transparent,
                icon: const Icon(Icons.keyboard_arrow_down,color: AppColors.white,),
                style: AppTextStyles.white20w700,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                items: [
                  DropdownMenuItem(value: "Dark",child: Text(locale.dark,style: AppTextStyles.white20w700,),),
                  DropdownMenuItem(value: "Light",child: Text(locale.light,style: AppTextStyles.white20w700,),),
                ], onChanged: (value){
                  if(value!=null){
                    setState(() {
                      initTheme=value;
                    });
                  }
                }),
          ),
          Divider(color: AppColors.white,height: 50,thickness: 2,indent: 16,endIndent: 16,),
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16),
            child: Row(
              spacing: 8,
              children: [
                ImageIcon(AssetImage(AppAssets.icnLanguage),color: AppColors.white,),
                Text(locale.language,style: AppTextStyles.white20w700,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(value: provider.appLocal,
                dropdownColor:Colors.transparent,
                icon: const Icon(Icons.keyboard_arrow_down,color: AppColors.white,),
                style: AppTextStyles.white20w700,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                items: [
                  DropdownMenuItem(value: "en",child: Text(locale.english,style: AppTextStyles.white20w700,),),
                  DropdownMenuItem(value: "ar",child: Text(locale.arabic,style: AppTextStyles.white20w700,),),
                ], onChanged: (value){
                  if(value!=null){
                    provider.changeLanguage(value);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
