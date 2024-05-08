import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';

class CommonDropDown extends StatefulWidget {
  const CommonDropDown({super.key, required this.hintText, required this.list});

  final String hintText;
  final List<String>? list;

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

TextEditingController searchCtrl = TextEditingController();

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCtrl>(
      builder: (ctrl) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              hint: Text(
                widget.hintText,
                style: kTextStyle(
                    fontWeight: FontWeight.w500, size: 15, color: greyClr),
                overflow: TextOverflow.ellipsis,
              ),
              items: widget.list!
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:
                            kTextStyle(size: 15, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              value: ctrl.dropDownSelected,
              onChanged: (String? value) {
                ctrl.updateDropDown(value ?? '');
              },
              buttonStyleData: ButtonStyleData(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 12, right: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: greyClr),
                    borderRadius: BorderRadius.circular(10)),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.arrow_drop_down, size: 24),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                    color: whiteClr,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: searchCtrl,
                searchInnerWidgetHeight: 80,
                searchInnerWidget: Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: '   Search',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)),
                    ),
                    controller: searchCtrl,
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value!
                      .toLowerCase()
                      .contains(searchValue.toLowerCase().toString());
                },
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 48,
                padding: EdgeInsets.only(left: 18, right: 14),
              ),
            ),
          ),
        );
      },
    );
  }
}
