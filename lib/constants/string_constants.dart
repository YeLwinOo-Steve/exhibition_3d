import 'package:exhibition_3d/domain_model/tip.dart';

const String ksTitle = "A wise man said";
const String ksQuote =
    "❝ You either die a Hero or suffer long enough to see yourself become a Software Engineer ❞";
const String ksExplore = "Explore Tips to be a Better Programmer";
const String ksBetterProgrammerTip = "Better Programmer Tips";
const String ksProTips = "Explore Pro Tips";

const String picture1 = "picture_1";
const String picture2 = "picture_2";
const String picture3 = "picture_3";
const String picture4 = "picture_4";

final List<Tip> tipsList = [
  Tip(
    title: 'Continuous Learning',
    description:
        "Stay updated with the latest technologies and languages. Dedicate time each week to reading documentation, tutorials, or taking online courses to expand your knowledge.",
  ),
  Tip(
    title: 'Master a Language, but Be Polyglot',
    description:
        "While it's essential to have expertise in one or more programming languages, don't limit yourself to just one. Learning different languages exposes you to diverse paradigms and problem-solving approaches, making you a more versatile programmer.",
  ),
  Tip(
    title: 'Read and Write Code',
    description: "Don't just write code; read other people's code, especially from open-source projects. It exposes you to various coding styles, architectures, and problem-solving techniques, helping you become a more well-rounded programmer.",
  ),
  Tip(
    title: 'Soft Skills Mastery',
    description: "Effective communication, time management, and teamwork are essential skills in any programming job. They can impact your career growth and your ability to collaborate on successful projects.",
  ),
  Tip(
    title: "Testing",
    description: "Implement thorough testing practices, including unit, integration, and regression testing. Automated testing ensures that your code functions as expected and helps catch and fix bugs early in the development process.",
  ),
  Tip(
    title: "Master Debugging",
    description: "Debugging is a constant companion in programming. Develop strong debugging skills, including using debugging tools, analyzing logs, and asking the right questions to find and fix issues effectively.",
  ),
  Tip(
    title: "Contribute to Open Source",
    description: "Get involved in open-source projects. It's an excellent way to collaborate with experienced developers, gain real-world experience, and give back to the community.",
  ),
];
