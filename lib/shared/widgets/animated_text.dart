import '../../feature/landing_page/exports.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final Duration duration;
  final TextStyle? style;
  final bool replay;

  AnimatedText({required this.text,
    this.style,
    this.replay = false,
    this.duration = const Duration(milliseconds: 300), this.c});
final AnimationController? c;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: text.split('').asMap().entries.map((entry) {
        int index = entry.key;
        String letter = entry.value;

        return Animate(
          controller:c ,
          effects: [
            SlideEffect(
              begin: Offset(0, 1), // Start from below
              end: Offset(0, 0),   // Move to its original position
              duration: duration,
            ),
            FadeEffect(duration: duration),
          ],
          // onPlay: replay ? (controller) => controller.repeat(
          //   period: Duration(milliseconds: 300)
          // ) : null,
          delay: (duration * index).inMilliseconds.ms, // Delay each letter's appearance
          child: Text(
            letter,
            style: style ?? TextStyle(fontSize: 32, fontWeight: FontWeight.w900,color: AppColors.appWhite),
          ),
        );
      }).toList(),
    );
  }
}