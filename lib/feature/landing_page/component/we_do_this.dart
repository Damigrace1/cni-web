

import '../exports.dart';

class WeDoThis extends StatelessWidget {
  const WeDoThis(
      {Key? key, required this.child, required this.title, required this.body})
      : super(key: key);
  final Widget child;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.appRed,
          child: child,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          body,
          style: TextStyle(color: AppColors.appGrey),
        ),
      ],
    );
  }
}