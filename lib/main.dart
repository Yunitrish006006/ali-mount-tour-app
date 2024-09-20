import 'package:adaptor_games/common/combined_notifier.dart';
import 'package:adaptor_games/screen/loading_page.dart';
import 'package:adaptor_games/screen/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AliMountAppRoot());
}

class AliMountAppRoot extends StatelessWidget {
  const AliMountAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CombinedNotifier(),
      child: Consumer<CombinedNotifier>(
        builder: (context, notifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.colorTheme.begin,
            darkTheme: notifier.colorTheme.end,
            themeMode: notifier.themeMode,
            locale: notifier.currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const LoadPage(),
            routes: {
              '/load_page': (context) => const LoadPage(),
              '/map_page': (context) => const MapPage()
            },
          );
        },
      ),
    );
  }
}
