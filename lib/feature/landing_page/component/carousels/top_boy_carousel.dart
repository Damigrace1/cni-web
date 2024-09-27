import '../../exports.dart';

class TopBodyCarousel extends StatelessWidget {
  const TopBodyCarousel({
    super.key,
    required this.image,
    required this.child,
  });
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          foregroundDecoration:
          BoxDecoration(color: Colors.black.withOpacity(0.7)),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}