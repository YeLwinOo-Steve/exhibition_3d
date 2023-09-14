import 'package:exhibition_3d/domain_model/story.dart';

const String ksTitle = "A Wise Man Says";
const String ksQuote =
    "❝You either die a Hero or suffer long enough to see yourself become a Software Engineer!❞";
const String ksExplore = "Explore Story";

const String picture1 = "picture_1";
const String picture2 = "picture_2";
const String picture3 = "picture_3";
const String picture4 = "picture_4";

final Map<String, Story> stories = {
  picture1: Story(
    title: 'About Me',
    description: "I have nothing to say!",
  ),
  picture2: Story(
    title: 'Something',
    description: "I don't know yet.",
  ),
  picture3: Story(
    title: 'Nothing',
    description: 'With great power comes great responsibility.',
  ),
  picture4: Story(
    title: 'Anything',
    description: "It's ok to eat fish cause they don't have any feelings.",
  ),
};
