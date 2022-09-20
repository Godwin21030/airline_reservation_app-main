class OnboardingContent {
  String? svgPath;
  String title;
  String description;
  OnboardingContent({
    this.svgPath,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> content = [
  OnboardingContent(
    svgPath: 'assets/svgs/world.svg',
    title: 'Travel The World',
    description:
        'Now no need to worry when you want to go anywhere, find your flight tickets to various destinations you want in just one app!',
  ),
  OnboardingContent(
    svgPath: 'assets/svgs/aircraft.svg',
    title: 'Best Experience',
    description:
        'Now no need to worry when you want to go anywhere, find your flight tickets to various destinations you want in just one app!',
  ),
  OnboardingContent(
    svgPath: 'assets/svgs/findflight.svg',
    title: 'Fast and Reliable',
    description:
        'Now no need to worry when you want to go anywhere, find your flight tickets to various destinations you want in just one app!',
  ),
];
