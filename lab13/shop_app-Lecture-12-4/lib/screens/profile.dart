import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';
import 'package:shop_app/provider/LocaleModel.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/product_detail.dart';
import 'package:shop_app/widgets/ProfileMenuItem.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of(context, AppLocalizations)!;
    return Consumer<Global_provider>(builder: (context, provider, child) {
      return SafeArea(
          child: Scaffold(
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                loc.profile,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(223, 37, 37, 37),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1615751072497-5f5169febe17?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${provider.username?.capitalize()} ',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      DropdownButton<String>(
                        value: Provider.of<LocaleModel>(context)
                                .locale
                                ?.languageCode ??
                            'en',
                        items: const [
                          DropdownMenuItem(value: 'en', child: Text('English')),
                          DropdownMenuItem(value: 'mn', child: Text('Монгол')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            Provider.of<LocaleModel>(context, listen: false)
                                .setLocale(Locale(value));
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ProfileMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: loc.myOrders,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.home,
                    title: loc.shippingAddresses,
                    onTap: () {},
                  ),
                  const Divider(),
                  ProfileMenuItem(
                    icon: Icons.payment_rounded,
                    title: loc.promotionCodes,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.qr_code,
                    title: loc.myReviews,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings,
                    title: loc.settings,
                    onTap: () {},
                  ),
                  const Spacer(),
                ],
              ),
            ))
          ])));
    });
  }
}
