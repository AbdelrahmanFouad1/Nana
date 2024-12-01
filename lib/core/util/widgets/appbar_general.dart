import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';

class AppbarGeneral extends StatelessWidget implements PreferredSizeWidget{
  const AppbarGeneral({
    super.key,
    this.actions,
    this.onPressed,
    this.title,
    this.leading,
    this.leadingPadding,
  });


  final List<Widget>? actions;
  final void Function()? onPressed;
  final String? title;
  final Widget? leading;
  final EdgeInsetsGeometry? leadingPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  leadingPadding ?? EdgeInsets.zero,
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: leading ??
            IconButton(
              icon: RotatedBox(
                quarterTurns: LanguageManager.isArabic ? 2 : 0,
                child: Assets.icons.arrowLeft.svg(),
              ),
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.all(12.w)),
                backgroundColor:
                    WidgetStateProperty.all(context.appColor.primary.withOpacity(0.1)),
                shape: WidgetStateProperty.all(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              onPressed: onPressed ?? () => context.pop(),
            ),
        actions: actions,
        title: title.isNotBlank
            ? Text(
                title!,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            : null,
        titleSpacing: title.isNotBlank ? 16.w : null,
        centerTitle: title.isNotBlank ? false : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
