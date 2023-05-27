import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';

class InComingEventComposite extends StatelessWidget {
  final PageController pageController;

  const InComingEventComposite({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padEnds: true,
            itemCount: 3,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return const EventItemComponent();
            },
          ),
        ),
      ],
    );
  }
}