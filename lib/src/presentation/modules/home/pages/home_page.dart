import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:ekayanaarama/src/presentation/modules/home/view/home_activity_view.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _NavBarSection(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 0,
                  right: 16,
                  bottom: 12,
                ),
                child: _HeaderSection(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16.0,
                ),
                child: InComingEventView(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: _MenuDopeSection(
                  menuDopes: [
                    // _MenuDope(
                    //   title: "Renungan Harian",
                    //   backgroundColor: Color(0xFF4B62EA),
                    //   deeplink: "",
                    // ),
                    _MenuDope(
                      title: "Kegiatan Rutin",
                      backgroundColor: Color(0xFFF918A8),
                      deeplink: RouteName.routineActivity,
                    ),
                    _MenuDope(
                      title: "Event",
                      backgroundColor: Color(0xFF7F18F9),
                      deeplink: RouteName.event,
                    ),
                    _MenuDope(
                      title: "Buddhavacana",
                      backgroundColor: Color(0xFFFF6369),
                      deeplink: RouteName.buddavacana,
                    ),
                    // _MenuDope(
                    //   title: "Lagu Buddhis",
                    //   backgroundColor: Color(0xFFFF63F6),
                    //   deeplink: "",
                    // ),
                    _MenuDope(
                      title: "Ebook Buddhis",
                      backgroundColor: Color(0xFF4BC1EA),
                      deeplink: RouteName.ebooks,
                    ),
                    // _MenuDope(
                    //   title: "Kalendar Lunar",
                    //   backgroundColor: Color(0xFF20C98F),
                    //   deeplink: "",
                    // ),
                    _MenuDope(
                      title: "Tentang Ekayana",
                      backgroundColor: Color(0xFFFF8C00),
                      deeplink: RouteName.aboutEkayana,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
                child: HomeActivityView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _NavBarSection({Key? key}) : super(key: key);

  static const double defaultHeight = 76;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        height: double.infinity,
        alignment: Alignment.centerLeft,
        child: Text(
          "Namo Buddhaya",
          style: TypographyToken.headingSmall,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(defaultHeight);
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Tappable(
          borderRadius: BorderRadius.circular(16),
          onTap: () => Get.toNamed(RouteName.dailyReflection),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorToken.gray_50,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Iconography.lightBulb_02,
                  color: ColorToken.primary_500,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Renungan Hari ini",
                        style: TypographyToken.textMediumBold,
                      ),
                      Text(
                        "Karakteristik & Esensi Ajaran Zen",
                        style: TypographyToken.textSmallSemiBold.copyWith(
                          color: ColorToken.gray_500,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  Iconography.chevronRight,
                  color: ColorToken.primary_500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuDopeSection extends StatelessWidget {
  final List<_MenuDope> menuDopes;

  const _MenuDopeSection({
    Key? key,
    required this.menuDopes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 160 / 64,
      ),
      itemCount: menuDopes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: menuDopes[index].backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Tappable(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              Get.toNamed(menuDopes[index].deeplink);
            },
            child: Container(
              height: 64,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                menuDopes[index].title,
                style: TypographyToken.textMediumBold.copyWith(
                  color: ColorToken.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MenuDope {
  final String title;
  final Color backgroundColor;
  final String deeplink;

  const _MenuDope({
    required this.title,
    required this.backgroundColor,
    required this.deeplink,
  });
}