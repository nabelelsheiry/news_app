import 'package:flutter/material.dart';
import 'package:news/core/utiles/app_assets.dart';

import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/screens/home/listview_widget.dart';
import 'package:news/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagesLight=[
    AppAssets.listview1,
    AppAssets.listview2,
    AppAssets.listview3,
    AppAssets.listview4,
    AppAssets.listview5,
    AppAssets.listview6,
    AppAssets.listview7,
  ];
  final List<String> imagesDark=[
    AppAssets.listviewDark1,
    AppAssets.listviewDark2,
    AppAssets.listviewDark3,
    AppAssets.listviewDark4,
    AppAssets.listviewDark1,
    AppAssets.listviewDark2,
    AppAssets.listviewDark3,
  ];

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar:AppBar(
        title: Text(locale.general),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 16,)
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(locale.goodMorning,style: theme.textTheme.bodySmall,),
              Text(locale.hereIsSomeNewsForYou ,style: theme.textTheme.bodySmall,),
            const SizedBox(height: 16,),
            Expanded(child: ListviewWidget(images: imagesLight))
          ],
        ),
      )),
    );
  }
}
