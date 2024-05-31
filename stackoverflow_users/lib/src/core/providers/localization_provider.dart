import 'package:flutter/cupertino.dart';
import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';


class LocalizationProvider extends StatefulWidget {
  final Widget child;

  const LocalizationProvider({super.key, required this.child});

  static _LocalizationProviderState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedLocalizationProvider>()!.data;
  }

  @override
  _LocalizationProviderState createState() => _LocalizationProviderState();
}

class _LocalizationProviderState extends State<LocalizationProvider> {
  Locale _locale = SharedPrefs.getLocale();

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    SharedPrefs.saveLocale(locale);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedLocalizationProvider(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedLocalizationProvider extends InheritedWidget {
  final _LocalizationProviderState data;

  const _InheritedLocalizationProvider({required this.data, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedLocalizationProvider oldWidget) => true;
}
