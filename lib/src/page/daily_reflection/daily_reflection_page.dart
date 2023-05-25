import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/component/circular_button_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyReflectionPage extends StatelessWidget {
  const DailyReflectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorToken.black,
      child: Stack(
        children: [
          SizedBox(
            height: Get.height - 80,
            child: Stack(
              children: [
                _getBackground(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 16,
                        left: 16,
                      ),
                      child: CircularButtonComponent(
                        icon: Iconography.close,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Melalui cara kita berpikir dan melalui cara kita memercayai sesuatu, dunia kita terbentuk. Di abad pertengahan, setiap orang hanya menerima gagasan yang diberikan, atas dasar rasa takut, bahwa hanya ada satu cara untuk percaya; jika anda mempunyai kepercayaan yang lain, anda adalah musuh. Kondisi seperti itu merupakan lonceng kematian bagi pola pemikiran bebas dan kreatif.",
                                  style: TypographyToken.headingSmall.apply(
                                    color: ColorToken.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 42,
                                ),
                                Text(
                                  "Pema Chodron",
                                  style: TypographyToken.textMediumBold.apply(
                                    color: ColorToken.white,
                                  ),
                                ),
                                Text(
                                  "Kebijakan Seajti, Hal.51",
                                  style: TypographyToken.textMediumBold.apply(
                                    color: ColorToken.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      children: const [
                        CircularButtonComponent(icon: Iconography.columns),
                        SizedBox(
                          width: 8,
                        ),
                        CircularButtonComponent(icon: Iconography.volumeMax),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("asd"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBackground() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        image: DecorationImage(
          image: AssetImage(
            'asset/drawable/bg_blue.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
