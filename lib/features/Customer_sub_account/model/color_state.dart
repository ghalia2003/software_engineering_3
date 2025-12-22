import 'dart:ui';

import 'package:flutter_application_12/core/utils/colors_theme.dart';
Color getStatusColor(String status) {
  switch (status) {
    case "Active":
      return ColorsTheme.successGreen;
    case "Frozen":
      return ColorsTheme.warningOrange;
    case "Suspended":
      return ColorsTheme.errorRed;
    case "Closed":
      return ColorsTheme.textGrey;
    default:
      return ColorsTheme.textDark;
  }
}
