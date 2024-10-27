


import '../../../../shared/widgets/animated_text.dart';
import '../../exports.dart';

class C2 extends StatelessWidget {
  const C2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TopBodyCarousel(
      image: 'assets/images/c1.jpeg',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CATALYST NETWORK INTERNATIONAL',
              style: GoogleFonts.farro(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))
              .animate(
            autoPlay: true,
            // onComplete: (v) {
            //   bC?.forward();
            // }
          )
              .scale(
              begin: Offset(3, 3),
              end: Offset(1, 1),
              duration: const Duration(milliseconds: 800)),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: AnimatedText(
                text: "A place to experience the supernatural in God.",
                //  c: longTexCont,
                duration: 70.ms,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appWhite)),
          ),
          const SizedBox(
            height: 12,
          ),
          const AppButton(
            text: 'GET IN TOUCH',
          ).animate().slideY(
              begin: 20,
              end: 1,
              duration: const Duration(milliseconds: 800)),
        ]
            .animate(
          autoPlay: true,
        )
            .slideY(duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}