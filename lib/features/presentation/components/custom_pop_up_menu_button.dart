import 'package:flutter/material.dart';

import '../../../../../core/shared/pop_up_menu_item_model.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  final List<PopUpMenuItemModel> buttons;
  final bool isGroup;

  const CustomPopUpMenuButton({
    super.key,
    required this.buttons,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon:
          //  userEntity != null ?
          Icon(
        Icons.more_vert,
        color: isGroup
            ? (
                // userEntity!.theme == 'Light' ? Colors.black54 : Colors.grey
                Colors.black54)
            : (
                // userEntity!.theme == 'Light' ? Colors.white : Colors.grey
                Colors.white),
      ),
      // : Icon(
      //   Icons.more_vert,
      //   color: isGroup ? Colors.black38: Colors.white,
      // ),
      color:
          // userEntity == null?
          Colors.white,
      // : (userEntity!.theme == 'Light' ? Colors.white : Color(0xFF233138)),
      onSelected: (value) {
        buttons[value].onTap();
      },
      itemBuilder: (context) {
        return buttons.map((e) {
          int index = buttons.indexOf(e);
          return PopupMenuItem(
            value: index,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(e.name),
            ),
          );
        }).toList();
      },
    );
  }
}
