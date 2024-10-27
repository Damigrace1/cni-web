
import '../../../../shared/widgets/animated_text.dart';
import '../../exports.dart';

class C1 extends StatelessWidget {
  const C1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TopBodyCarousel(
      image: 'assets/images/c2.jpg',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CATALYST NETWORK INTERNATIONAL',
              style: GoogleFonts.farro(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))
              .animate(autoPlay: true,
            // onInit: (v) => cniTexCont = v
          )
              .scale(duration: const Duration(milliseconds: 800)),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: AnimatedText(
                text: "Welcome",
                duration: 300.ms,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appWhite)),
          ),
          // const Text(
          //     'A place to experience the supernatural in God.',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: AppColors.appWhite)),
          const SizedBox(
            height: 12,
          ),
          const AppButton(
            text: 'ABOUT US',
          ),
        ]
            .animate(autoPlay: true)
            .slideY(duration: const Duration(milliseconds: 800)),
      ),
    );
  }
}