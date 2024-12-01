import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppForm extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType type;
  final String? error;
  final bool isPassword;
  final bool showError;
  final bool readOnly;
  final Function(String)? onChange;
  final Function()? onTab;
  final TextInputAction? textInputAction;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? toolTip;
  final bool? autoFocus;

  final bool isPhoneNumber;
  final int? linesNumber;
  final String? initialValue;
  final FocusNode? focusNode;
  final Key? keys;
  final bool hintSameAsValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final bool? isArabicDirection;

  const AppForm({
    super.key,
    this.hint,
    this.controller,
    this.type = TextInputType.text,
    this.error,
    this.isPassword = false,
    this.readOnly = false,
    this.showError = false,
    this.onChange,
    this.onTab,
    this.textInputAction,
    this.label,
    this.prefixIcon,
    this.toolTip,
    this.autoFocus,
    this.linesNumber,
    this.suffixIcon,
    this.initialValue,
    this.isPhoneNumber = false,
    this.inputFormatters,
    this.focusNode,
    this.keys,
    this.hintSameAsValue = false,
    this.style,
    this.isArabicDirection,
  });

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  bool obscureText = true;

  final _borderDecoration = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(HxaColorsLight.grey400),
    ),
    borderRadius: BorderRadius.circular(8.0.r),
  );

  final _focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(HxaColorsLight.primary),
    ),
    borderRadius: BorderRadius.circular(8.0.r),
  );

  final _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(HxaColorsLight.errorColor),
    ),
    borderRadius: BorderRadius.circular(8.0.r),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.appColor.subHeading,
                  )),
          8.verticalSpace,
        ],
        Directionality(
          textDirection: widget.isArabicDirection == null
              ? LanguageManager.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr
              : widget.isArabicDirection!
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: TextFormField(
            key: widget.keys,
            autofocus: widget.autoFocus ?? false,
            controller: widget.controller,
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            initialValue: widget.initialValue,
            maxLines: widget.linesNumber ?? 1,
            strutStyle: StrutStyle(
              height: 1.h,
            ),
            onTap: widget.onTab,
            textInputAction: widget.textInputAction,
            textAlignVertical: TextAlignVertical.center,
            style: widget.style ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
            enableInteractiveSelection: true,
            canRequestFocus: true,
            cursorColor: context.appColor.primary,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            validator: (value) {
              if (value!.isEmpty) {
                return widget.error;
              }

              return null;
            },
            keyboardType: widget.type,
            obscureText: widget.isPassword ? obscureText : false,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              fillColor: context.appColor.grey300,
              filled: true,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              hintText: widget.hint,
              hintStyle: widget.hintSameAsValue
                  ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      )
                  : Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.appColor.grey500,
                        fontWeight: FontWeight.w400,
                      ),
              focusedBorder: !widget.readOnly
                  ? (widget.showError || widget.toolTip != null)
                      ? _errorBorder
                      : _focusedBorder
                  : _borderDecoration,
              enabledBorder: (widget.showError || widget.toolTip != null)
                  ? _errorBorder
                  : _borderDecoration,
              border: _borderDecoration,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: obscureText
                          ? Assets.icons.eyeSlash.svg()
                          : Assets.icons.eye.svg(),
                    )
                  : widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              suffixIconConstraints: BoxConstraints(
                minWidth: 50.w,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 50.w,
              ),
            ),
          ),
        ),
        if (widget.toolTip != null)
          Container(
            padding: EdgeInsets.all(12.w),
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: context.appColor.errorColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0.r),
              border: Border.all(
                color: context.appColor.errorColor,
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.danger.svg(),
                8.horizontalSpace,
                Expanded(
                  child: Text(
                    '${context.error}: ${widget.toolTip!}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: context.appColor.errorColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
