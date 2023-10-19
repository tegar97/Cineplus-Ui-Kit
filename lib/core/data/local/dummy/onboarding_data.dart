class onBoardingContent {
  String? image;
  String? title;
  String? description;
  onBoardingContent(
      {required this.image, required this.title, required this.description});
}

List<onBoardingContent> contents = [
  onBoardingContent(
      image: 'assets/images/onboarding_image_1.png',
      title: 'Unlimited movies & TV Shows',
      description: 'Watch anywhere and anytime.'),
  onBoardingContent(
      image: 'assets/images/onboarding_image_2.png',
      title: 'Download and watch offline',
      description: 'Always have something to watch offline'),
  onBoardingContent(
      image: 'assets/images/onboarding_image_3.png',
      title: 'Watch on any devices',
      description: 'PC, Laptop, Smartphone you name it'),
];
