class Faq {
  String title;
  String data;
  Faq(this.title, this.data);
}

class FaqData {
  List<Faq> faqs = [
    Faq("What is Flutter?",
        'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
    Faq('Who is Flutter for?',
        'For users, Flutter makes beautiful apps come to life, For developers, Flutter lowers the bar to entry for building apps. It speeds app development and reduces the cost and complexity of app production across platforms.'),
    Faq('How much development experience do I need to use Flutter?',
        'Flutter is approachable to programmers familiar with object-oriented concepts (classes, methods, variables, etc) and imperative programming concepts (loops, conditionals, etc)'),
    Faq('What kinds of apps can I build with Flutter?',
        'Apps that need to deliver highly branded designs are particularly well suited for Flutter. However, you can also create pixel-perfect experiences that match the Android and iOS design languages with Flutter.'),
    Faq('Who makes Flutter?',
        'Flutter is an open source project, with contributions from Google and other companies and individuals'),
    Faq('Who uses Flutter?',
        'Developers inside and outside of Google use Flutter to build beautiful natively-compiled apps for iOS and Android. To learn about some of these apps, visit the showcase.'),
    Faq('What makes Flutter unique?',
        'Flutter is different than most other options for building mobile apps because it doesn’t rely on web browser technology nor the set of widgets that ship with each device. Instead, Flutter uses its own high-performance rendering engine to draw widgets.'),
    Faq("What is Flutter?",
        'Flutter is Google’s portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
    Faq('Who is Flutter for?',
        'For users, Flutter makes beautiful apps come to life, For developers, Flutter lowers the bar to entry for building apps. It speeds app development and reduces the cost and complexity of app production across platforms.'),
    Faq('How much development experience do I need to use Flutter?',
        'Flutter is approachable to programmers familiar with object-oriented concepts (classes, methods, variables, etc) and imperative programming concepts (loops, conditionals, etc)'),
    Faq('What kinds of apps can I build with Flutter?',
        'Apps that need to deliver highly branded designs are particularly well suited for Flutter. However, you can also create pixel-perfect experiences that match the Android and iOS design languages with Flutter.'),
  ];
}
