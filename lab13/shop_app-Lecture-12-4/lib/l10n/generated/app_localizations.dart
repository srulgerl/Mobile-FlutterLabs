import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_mn.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('mn')
  ];

  /// No description provided for @shop.
  ///
  /// In mn, this message translates to:
  /// **'Бараанууд'**
  String get shop;

  /// No description provided for @basket.
  ///
  /// In mn, this message translates to:
  /// **'Сагс'**
  String get basket;

  /// No description provided for @basketState.
  ///
  /// In mn, this message translates to:
  /// **'Сагс хоосон байна'**
  String get basketState;

  /// No description provided for @favorites.
  ///
  /// In mn, this message translates to:
  /// **'Хадгалсан'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In mn, this message translates to:
  /// **'Профайл'**
  String get profile;

  /// No description provided for @myProfile.
  ///
  /// In mn, this message translates to:
  /// **'Миний Профайл'**
  String get myProfile;

  /// No description provided for @myOrders.
  ///
  /// In mn, this message translates to:
  /// **'Миний Захиалгууд'**
  String get myOrders;

  /// No description provided for @shippingAddresses.
  ///
  /// In mn, this message translates to:
  /// **'Хүргэлтийн Хаягууд'**
  String get shippingAddresses;

  /// No description provided for @paymentMethods.
  ///
  /// In mn, this message translates to:
  /// **'Төлбөрийн Хэрэгслүүд'**
  String get paymentMethods;

  /// No description provided for @promotionCodes.
  ///
  /// In mn, this message translates to:
  /// **'Урамшууллын Кодууд'**
  String get promotionCodes;

  /// No description provided for @myReviews.
  ///
  /// In mn, this message translates to:
  /// **'Миний Сэтгэгдэл'**
  String get myReviews;

  /// No description provided for @settings.
  ///
  /// In mn, this message translates to:
  /// **'Тохиргоо'**
  String get settings;

  /// No description provided for @priceLabel.
  ///
  /// In mn, this message translates to:
  /// **'Үнэ: {price}'**
  String priceLabel(Object price);

  /// No description provided for @categoryLabel.
  ///
  /// In mn, this message translates to:
  /// **'Ангилал: {category}'**
  String categoryLabel(Object category);

  /// No description provided for @ratingLabel.
  ///
  /// In mn, this message translates to:
  /// **'Үнэлгээ: {rating} ({count})'**
  String ratingLabel(Object count, Object rating);

  /// No description provided for @total.
  ///
  /// In mn, this message translates to:
  /// **'Нийт'**
  String get total;

  /// No description provided for @paymentSuccess.
  ///
  /// In mn, this message translates to:
  /// **'Төлбөр амжилттай төлөгдлөө'**
  String get paymentSuccess;

  /// No description provided for @buy.
  ///
  /// In mn, this message translates to:
  /// **'Худалдаж авах'**
  String get buy;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'mn'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'mn':
      return AppLocalizationsMn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
