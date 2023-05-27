import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/component/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DanaInformationPage extends StatelessWidget {
  const DanaInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorToken.white,
        appBar: NavBarComponent(
          title: "Informasi Dana",
          onNavigationTap: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Text(
                  "Bagi Anda yang ingin berdana untuk perkembangan Buddha Dharma, Anda bisa menyalurkan dana Anda melalui transfer ke:",
                ),
                SizedBox(
                  height: 24,
                ),
                _BankAccountComponent(
                  accountName: 'PU Wihara Ekayana Arama',
                  accountNumber: '3973019968',
                ),
                SizedBox(height: 24,),
                _BankAccountComponent(
                  accountName: 'Wihara Ekayana Arama',
                  accountNumber: '1273012978',
                ),
              ],
            ),
          ),
        ));
  }
}

class _BankAccountComponent extends StatelessWidget {
  final String accountName;
  final String accountNumber;

  const _BankAccountComponent({
    Key? key,
    required this.accountName,
    required this.accountNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorToken.gray_50,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountName,
                style: TypographyToken.textSmallBold,
              ),
              Image.asset('asset/drawable/bca.png')
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                accountNumber,
                style: TypographyToken.textLargeBold,
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: accountNumber));
                },
                child: SvgPicture.asset(
                  Iconography.copy_06,
                  color: ColorToken.gray_600,
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "an. Yayasan Triyanavardhana Indonesia",
            style: TypographyToken.textSmallSemiBold,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: ButtonComponent(
                  text: "Lihat QRIS",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ButtonComponent(
                  text: "Simpan QRIS",
                  style: EkaButtonStyle.outline,
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
