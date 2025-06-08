import 'package:alpha_twelve_app/utils/debouncer.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({
    super.key,
    required this.inputController,
    required this.onChangeText,
  });

  final TextEditingController inputController;

  final Function(String text) onChangeText;

  final debouncer = Debouncer(const Duration(milliseconds: 1000));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: BoxBorder.all(
            width: 1,
            color: Color.fromRGBO(226, 232, 240, 1),
          ),
        ),
        child: TextField(
          controller: inputController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(
              FeatherIcons.search,
              color: Color.fromRGBO(148, 163, 184, 1),
            ),
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Color.fromRGBO(173, 181, 189, 1)),
          ),
          onChanged: (value) {
            if (inputController.text.isNotEmpty) {
              debouncer.run(() {
                onChangeText(value);
              });
            } else {
              onChangeText(value);
            }
          },
        ),
      ),
    );
  }
}
