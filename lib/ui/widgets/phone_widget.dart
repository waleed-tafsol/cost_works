import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../utils/validator.dart';

class PhoneWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController? countryCodeController; // optional
  final ValueSetter<String>? onChanged;

  final bool filled;
  final bool removeValidation;
  final bool isEditable;

  const PhoneWidget({
    super.key,
    required this.phoneController,
    this.countryCodeController,
    this.onChanged,

    this.filled = false,
    this.isEditable = false,
    this.removeValidation = false,
  });

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  late Country _currentCountry;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Default country
    _currentCountry = Country(
      phoneCode: '65',
      countryCode: 'SG',
      e164Sc: 0,
      geographic: false,
      level: 1,
      name: "Singapore",
      example: '81234567',
      displayName: 'Singapore (SG) [+65]',
      displayNameNoCountryCode: 'Singapore (SG)',
      e164Key: '',
    );

    // Initialize the country code controller if provided
    if (widget.countryCodeController != null) {
      widget.countryCodeController!.text = '+${_currentCountry.phoneCode}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: !widget.isEditable,
          controller: widget.phoneController,
          onChanged: widget.onChanged,
          autofocus: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: widget.removeValidation ? null : Validators.phone,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: AppColors.black),
          onTapOutside: (_) => _focusNode.unfocus(),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter Phone Number',

            prefixIcon: _buildPhoneNumberPicker(context),
          ),
        ),
      ],
    );
  }

  IntrinsicHeight _buildPhoneNumberPicker(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          if (widget.isEditable) {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              moveAlongWithKeyboard: true,
              countryListTheme: CountryListThemeData(
                bottomSheetWidth: MediaQuery.sizeOf(context).width,
                bottomSheetHeight: 560.h,
                textStyle: TextStyle(fontSize: 14.sp),
                searchTextStyle: TextStyle(fontSize: 14.sp),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(
                  top: 15.h,
                  bottom: 27.h,
                  left: 20.w,
                  right: 20.w,
                ),
              ),
              onSelect: (Country country) {
                setState(() {
                  _currentCountry = country;
                  if (widget.countryCodeController != null) {
                    widget.countryCodeController!.text =
                        '+${country.phoneCode}';
                  }
                });
              },
            );
          }
        },

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 4.w),
                  child: Text(
                    _currentCountry.flagEmoji,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                Text(
                  " ${_currentCountry.phoneCode}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 16.sp,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // widget.countryCodeController!.dispose();
    // widget.phoneController.dispose();
    super.dispose();
  }
}
