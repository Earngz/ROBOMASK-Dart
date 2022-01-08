import 'package:robomask/theme/app_color.dart';
import 'package:robomask/theme/app_size.dart';
import 'package:flutter/material.dart';

//Title
const TextStyle kTitleTextStyle = TextStyle(
  color: kTitleColor,
  fontSize: kTitleTextSize,
  fontWeight: kSemiBoldFontWeight,
);

//button text
const TextStyle kBtnTextStyle = TextStyle(
  color: kBtnTxtColor,
  fontSize: kBtnTextSize,
  fontWeight: kMediumFontWeight,
);

const TextStyle kTextStyle = TextStyle(
  color: kTitleColor,
  fontSize: kTextsize,
  fontWeight: kSemiBoldFontWeight,
);

const TextStyle kSubTextStyle = TextStyle(
  color: kTitleColor,
  fontSize: kTextsize,
  fontWeight: kMediumFontWeight,
);

const TextStyle kSubTitleTextStyle = TextStyle(
  color: kSubtitleColor,
  fontSize: kBodyTextSize,
  fontWeight: kMediumFontWeight,
);

//Btn shadow
const List<BoxShadow> kBtnShadow = [
  BoxShadow(
    color: kBtnShadowColor,
    offset: Offset(2, 4),
    blurRadius: 10,
  )
];

const List<BoxShadow> kCardShadow = [
  BoxShadow(
    color: kInactiveColor,
    offset: Offset(0, 2),
    blurRadius: 5,
  )
];
