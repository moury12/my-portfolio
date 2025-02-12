import 'package:protfolio/core/constant/image_constant.dart';
import 'package:protfolio/models/time_line_model.dart';

List<Map<String, dynamic>> drawerList = [
  {
    'text': 'About',
  },
  {
    'text': 'Education',
  },
  {
    'text': 'Experience',
  },
  {
    'text': 'Projects',
  },
];
List<Map<String, dynamic>> socialMediaList = [
  {
    'icon': linkedinIcon,
  },
  {
    'icon': gitIcon,
  },
  {
    'icon': mailIcon,
  },
  {
    'icon': whatsAppIcon,
  },
];
final List<TimelineEvent> educationList = [
  TimelineEvent(
      year: "2019",
      title: "Higher Secondary school certificate",
      description:
          "Monipur High School & College Branch-1\nRupnagar Mirpur,Dhaka,Bangldesh\nGPA:4.08"),
  TimelineEvent(
      year: "2023",
      title: "Bachelor of Science in Computer Science and Engineering",
      description:
          "Daffodil International University | DIU\nDaffodil Smart City, Birulia 1216,Bangladesh\nCGPA: 3.58"),
];
final List<TimelineEvent> experienceList = [
  TimelineEvent(
      year: "Sep 2023 - Feb 2024",
      title: "Mobile Application Developer Intern ",
      description:
          "Wizard Software & Technology Bangladesh Ltd.\nSonargaon Road,Dhaka,Bangldesh"),
  TimelineEvent(
      year: "June 2024 – Dec 2024",
      title: "Junior Flutter Developer ",
      description: "eAppair LTD.\n1 Asad Ave, Dhaka 1207"),
  TimelineEvent(
      year: "Dec 2024 -  Present",
      title: "Flutter Developer ",
      description:
          "Sparktech Agency(Bdcalling IT Ltd.)\n Block-C, Abdullah Park, Banasree Rampura, Dhaka, Bangladesh 1219."),
];
