import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palm_code/resources/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.showDivider = true,
    this.actions,
    this.showBackButton = true,
    this.customLeading = false,
    this.leading,
  });

  final String? title;
  final bool showDivider;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? leading;
  final bool customLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: customLeading
          ? leading
          : (Navigator.canPop(context) &&
                  !(ModalRoute.of(context)?.isFirst ?? true))
              ? leading ??
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.of(context).pop(),
                  )
              : null,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Visibility(
          visible: showDivider,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Theme.of(context).borderDivider,
              height: 1.0,
            ),
          ),
        ),
      ),
      titleSpacing: 20.0,
      toolbarHeight: 48,
      automaticallyImplyLeading: false,
      actions: actions,
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: Theme.of(context).body3,
      ),
      iconTheme: IconThemeData(color: Theme.of(context).contentPrimary),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
