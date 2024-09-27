import 'package:cni_web/feature/landing_page/component/we_do_this.dart';
import 'package:flutter/cupertino.dart';

import '../exports.dart';

class Body2 extends StatelessWidget {
  const Body2({
    super.key,
    required this.cw,
  });
  final double cw;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT US',
          style: TextStyle(
              color: AppColors.appBlue,
              fontWeight: FontWeight.w800,
              fontSize: 17),
        ),
        SizedBox(
          height: 20,
        ),
        Text('We are Taking Bold Steps to Make Earth Heaven',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35)),
        SizedBox(
          height: 20,
        ),
        Text(
            'We welcome you with great joy to CNI. We are here to share the great news of Jesus Christ to all that will listen.',
            style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 30,
        ),
        cw > 550
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WeDoThis(
                  child: Icon(
                    Icons.favorite_rounded,
                    color: AppColors.appWhite,
                  ),
                  title: 'Place of Heaven',
                  body:
                  'In CNI you will feel divinity, piety, goodness, faith or right beliefs.'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: WeDoThis(
                  child: Icon(
                    CupertinoIcons.book,
                    color: AppColors.appWhite,
                  ),
                  title: 'Study Bible',
                  body:
                  'Learn the Bible enhance your wisdom, give you boldness about your faith.'),
            )
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeDoThis(
                child: Icon(
                  Icons.favorite_rounded,
                  color: AppColors.appWhite,
                ),
                title: 'Place of Heaven',
                body:
                'At CNI you will feel divinity, piety, goodness, faith or right beliefs.'),
            SizedBox(
              height: 20,
            ),
            WeDoThis(
                child: Icon(
                  CupertinoIcons.book,
                  color: AppColors.appWhite,
                ),
                title: 'Study Bible',
                body:
                'Learn the Bible enhance your wisdom, give you boldness about your faith.')
          ],
        ),
        SizedBox(height: 30.h,),
        AppButton(text: 'Learn More',
          width: 150,)

      ],
    );
  }
}