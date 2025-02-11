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
final List<TimelineEvent> events = [
  TimelineEvent(
      year: "2019",
      title: "Higher Secondary school certificate",
      description: "Monipur College\nDhaka,Bangldesh\nGPA:4.08"),
  TimelineEvent(
      year: "2023",
      title: "Bachelor of Science in Computer Science and Engineering",
      description:
          "Daffodil International University | DIU\nDaffodil Smart City, Birulia 1216,Bangladesh\nCGPA: 3.58"),
];
