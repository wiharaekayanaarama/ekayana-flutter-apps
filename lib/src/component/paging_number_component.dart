import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PagingNumberComponent extends StatelessWidget {
  final Function(int)? onPageChange;

  const PagingNumberComponent({
    Key? key,
    this.onPageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PagingNumberController _controller = PagingNumberController();
    _controller.currentPage = 0;
    _controller.addListener(() {
      print("Triggered");
      onPageChange?.call(_controller.currentPage);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            Iconography.chevronLeft,
            color: ColorToken.primary_500,
          ),
        ),
        _PagingNumberSelected(value: '1', isSelected: true,),
        _PagingNumberSelected(value: "2"),
        _PagingNumberSelected(value: "3"),
        _PagingNumberSelected(value: "4"),
        _PagingNumberSelected(value: "5"),
        _PagingNumberSelected(value: "..."),
        _PagingNumberSelected(value: "10.json", isSelected: true,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(
            Iconography.chevronRight,
            color: ColorToken.primary_500,
          ),
        ),
      ],
    );
  }
}

class _PagingNumberSelected extends StatelessWidget {
  final bool isSelected;
  final String value;

  const _PagingNumberSelected({
    Key? key,
    required this.value,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          color: isSelected ? ColorToken.primary_0 : ColorToken.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            value,
            style: TypographyToken.textSmallSemiBold.apply(
              color: isSelected ? ColorToken.primary_500 : ColorToken.black
            ),
          ),
        ),
      ),
    );
  }
}

class PagingNumberController extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  /// Decreases page by 1 and notifies listeners
  prev() {
    _currentPage--;
    notifyListeners();
  }

  /// Increases page by 1 and notifies listeners
  next() {
    _currentPage++;
    notifyListeners();
  }

  /// Alias for setter
  navigateToPage(int index) {
    currentPage = index;
  }
}