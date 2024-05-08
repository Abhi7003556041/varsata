import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


DateTime _selectedDate = DateTime.now();

Future showYearDate(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Year"),
        content: Container(
          // Need to use container to add size constraint.
          width: 300,
          height: 300,
          child: YearPicker(
            firstDate: DateTime(DateTime.now().year - 100, 1),
            lastDate: DateTime(DateTime.now().year + 100, 1),
            initialDate: DateTime.now(),
            // save the selected date to _selectedDate DateTime variable.
            // It's used to set the previous selected date when
            // re-showing the dialog.
            selectedDate: _selectedDate,
            onChanged: (DateTime dateTime) {
              // close the dialog when year is selected.
              Navigator.pop(context);

              // Do something with the dateTime selected.
              // Remember that you need to use dateTime.year to get the year
            },
          ),
        ),
      );
    },
  );
}

Future showDateTimePicker(BuildContext context) async {
  DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(3000),
    helpText: "",
    // builder: (context, child) {
    //   return Theme(
    //     data: Theme.of(context).copyWith(
    //       colorScheme: const ColorScheme.light(
    //         primary: Color(0XFF4E525E), // <-- SEE HERE
    //         onPrimary: Colors.white, // <-- SEE HERE
    //         onSurface: Color(0XFF4E525E), // <-- SEE HERE
    //       ),
    //       textButtonTheme: TextButtonThemeData(
    //         style: TextButton.styleFrom(
    //           foregroundColor: const Color(0XFF4E525E),
    //         ),
    //       ),
    //     ),
    //     child: child!,
    //   );
    // },
  );
  if (date != null) {}
}

///text-Regular
Widget textRegular({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: "Outfit",
    ),
    textAlign: alignment ?? TextAlign.left,
  );
}

///text-Bold Style
Widget textBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontFamily: "Outfit"),
    textAlign: alignment ?? TextAlign.left,
  );
}

///text-Semi Bold Style
Widget textSemiBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
  dynamic alignment,
}) {
  return Text(
    text,
    maxLines: maxLine,
    // textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: "Outfit",
    ),
    textAlign: alignment ?? TextAlign.left,
  );
}

///Navigate Push
goto(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Without Back
gotoWithoutBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Untill Remove
gotoUtillBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => nextScreen,
      ),
      (route) => false);
}

///Pop Navigate
goBack(BuildContext context) {
  Navigator.of(context).pop();
}

///SnackBar

///Vertical Space
Widget vSpace(
  double h,
) {
  return SizedBox(
    height: h,
  );
}

///Horizontal Space
Widget hSpace(
  double w,
) {
  return SizedBox(
    width: w,
  );
}

///Custom Indicator
Widget progressIndicator(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
      ),
    ),
  );
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return MediaQuery.of(context).size.height;
  } else {
    return MediaQuery.of(context).size.width;
  }
}

// class AppFonts {
//   ///Dateformatter Variable
//   static var newDate;

//   ///Date Formatter
//   static dateAndTimeFormatChanged(date) {
//     // var d = date.split("").toString();
//     newDate = DateFormat("d MMM, yyyy, HH:mm").format(
//       DateTime.parse(
//         date,
//       ),
//     );

//     return newDate;
//   }

//   static dateFormatChanged(date) {
//     // var d = date.split("").toString();
//     newDate = DateFormat("d MMM, yyyy").format(
//       DateTime.parse(
//         date,
//       ),
//     );

//     return newDate;
//   }
// }

Widget buildText(String text, bool isReadmore) {
  final lines = isReadmore ? null : 3;
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(fontSize: 25),
        maxLines: lines,
        overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    ],
  );
}

OutlineInputBorder customOutlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
        color: Colors.black.withOpacity(0.2),
        width: 1,
        style: BorderStyle.solid),
  );
}

OutlineInputBorder customOutlineFocusBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.blue, width: 2, style: BorderStyle.solid),
  );
}

OutlineInputBorder customOutlineErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red, width: 2, style: BorderStyle.solid),
  );
}
