import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
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
                child: Header(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: MenuDope(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
                child: InComingEvent(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
                child: Agenda(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

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

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                colorFilter: const ColorFilter.mode(
                  ColorToken.primary_500,
                  BlendMode.srcIn,
                ),
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
                colorFilter: const ColorFilter.mode(
                  ColorToken.primary_500,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuDope extends StatelessWidget {
  const MenuDope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> menus = {
      'Renungan Harian': const Color(0xFF4B62EA),
      'Kegiatan Rugin': const Color(0xFFF918A8),
      'Event': const Color(0xFF7F18F9),
      'Buddhavacana': const Color(0xFFFF6369),
      'Lagu Buddhis': const Color(0xFFFF63F6),
      'Ebook Buddhis': const Color(0xFF4BC1EA),
      'Kalendar Lunar': const Color(0xFF20C98F),
      'Tentang Ekayana': const Color(0xFFFF8C00),
    };
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 160 / 64,
      ),
      itemCount: menus.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          child: Container(
            height: 64,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: menus.values.elementAt(index),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              menus.keys.elementAt(index),
              style: TypographyToken.textMediumBold.copyWith(
                color: ColorToken.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

class InComingEvent extends StatelessWidget {
  const InComingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.63);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Event yang akan datang", style: TypographyToken.headingSmall),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: pageController,
            padEnds: false,
            itemCount: 3,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return const EventItemComponent();
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SmoothPageIndicator(
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: ColorToken.primary_500,
                dotColor: ColorToken.primary_50,
              ),
              controller: pageController,
            ),
          ),
        ),
      ],
    );
  }
}

class Agenda extends StatelessWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jadwal acara hari ini", style: TypographyToken.headingSmall),
        const SizedBox(
          height: 24,
        ),
        const AgendaItemComponent(
          title: "Kebaktian Umum",
          time: "Minggu, 08:00 - 12:00 WIB (Mandari)\nMinggu, 17:00 - 19:00 WIB (Pali)",
          location: "Wihara Ekayana Arama",
        ),
        const SizedBox(
          height: 8,
        ),
        const AgendaItemComponent(
          title: "Kebaktian Umum",
          time: "Minggu, 08:00 - 12:00 WIB (Mandari)\nMinggu, 17:00 - 19:00 WIB (Pali)",
          location: "Wihara Ekayana Arama",
        ),
        const SizedBox(
          height: 8,
        ),
        const AgendaItemComponent(
          title: "Kebaktian Umum",
          time: "Minggu, 08:00 - 12:00 WIB (Mandari)\nMinggu, 17:00 - 19:00 WIB (Pali)",
          location: "Wihara Ekayana Arama",
        ),
        const SizedBox(
          height: 8,
        ),
        const AgendaItemComponent(
          title: "Kebaktian Umum",
          time: "Minggu, 08:00 - 12:00 WIB (Mandari)\nMinggu, 17:00 - 19:00 WIB (Pali)",
          location: "Wihara Ekayana Arama",
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
