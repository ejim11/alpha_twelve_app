import 'package:alpha_twelve_app/widgets/search_input.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddressAndSearchBoxContainer extends StatefulWidget {
  const AddressAndSearchBoxContainer({
    super.key,
    this.isSearchInputVisible,
    required this.backBtnText,
    required this.backBtnFunction,
  });

  final bool? isSearchInputVisible;
  final String backBtnText;
  final void Function() backBtnFunction;

  @override
  State<AddressAndSearchBoxContainer> createState() {
    return _AddressAndSearchBoxContainerState();
  }
}

class _AddressAndSearchBoxContainerState
    extends State<AddressAndSearchBoxContainer> {
  final _searchInputController = TextEditingController();

  void _onChangeSearchText(String text) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DottedBorder(
                      options: const RectDottedBorderOptions(
                        padding: EdgeInsets.all(0),
                        color: Color.fromRGBO(37, 99, 235, 1),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 4.3,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(147, 197, 253, 1),
                        ),
                        child: Text(
                          'Full Logo',
                          style: TextStyle(
                            color: Color.fromRGBO(37, 99, 235, 1),
                            fontFamily: 'SfPro',
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'DELIVERY ADDRESS',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        height: 2.8,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/bell-icon.png',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'Umuezike Road, Oyo State',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),

                if (widget.isSearchInputVisible != null)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      SearchInput(
                        inputController: _searchInputController,
                        onChangeText: _onChangeSearchText,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: BoxBorder.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: widget.backBtnFunction,
                  icon: Icon(
                    Icons.chevron_left,
                    color: Color.fromRGBO(100, 116, 139, 1),
                  ),
                  label: Text(
                    widget.backBtnText,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
