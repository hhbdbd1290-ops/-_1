import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'تصميماتي',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0D1117),
  ),
  home: const HelloPage(),
);
}
}

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage>
with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
  body: Center(
  child: AnimatedBuilder(
  animation: _animation,
  builder: (context, child) {
    return Opacity(
    opacity: 0.6 + (_animation.value * 0.4),
    child: Text(
    'Hello World from Codweva',
    style: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Color.lerp(
    const Color(0xFF58A6FF),
    const Color(0xFF1F6FEB),
    import 'dart:io';

    import 'package:flutter/material.dart';
    import 'package:image_picker/image_picker.dart';
    import 'package:path_provider/path_provider.dart';
    import 'package:share_plus/share_plus.dart';
    import 'package:video_player/video_player.dart';
    import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
    import 'package:ffmpeg_kit_flutter_new/return_code.dart';

    void main() {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const VidoraApp());
    }

  // ============================================================
  // APP
  // ============================================================

  class VidoraApp extends StatelessWidget {
    const VidoraApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vidora',
      locale: const Locale('ar'),
      theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0A0A0F),
      colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF8B5CF6),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  ),
  home: const HomeScreen(),
);
}
}

// ============================================================
// HOME
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _pickVideo(BuildContext context) async {
    final picker = ImagePicker();

    final XFile? file = await picker.pickVideo(
    source: ImageSource.gallery,
  );

  if (file == null || !context.mounted) return;

  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (_) => EditorScreen(
  source: File(file.path),
),
),
);
}

@override
Widget build(BuildContext context) {
  return Directionality(
  textDirection: TextDirection.rtl,
  child: Scaffold(
  body: SafeArea(
  child: Padding(
  padding: const EdgeInsets.fromLTRB(
  20,
  24,
  20,
  18,
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
// HEADER
Row(
children: [
Container(
width: 48,
height: 48,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
gradient: const LinearGradient(
colors: [
Color(0xFF8B5CF6),
Color(0xFFEC4899),
],
),
),
child: const Icon(
Icons.movie_creation_outlined,
color: Colors.white,
),
),
const SizedBox(width: 12),
const Text(
'Vidora',
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.w900,
),
),
const Spacer(),
IconButton(
onPressed: () {},
icon: const Icon(
Icons.settings_outlined,
),
),
],
),

const SizedBox(height: 50),

const Text(
'اصنع فيديوك بطريقتك',
textAlign: TextAlign.right,
style: TextStyle(
fontSize: 29,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

Text(
'محرر فيديو عربي سريع وسهل للموبايل',
textAlign: TextAlign.right,
style: TextStyle(
color: Colors.white.withOpacity(.55),
fontSize: 15,
),
),

const Spacer(),

// NEW PROJECT
FilledButton.icon(
onPressed: () => _pickVideo(context),
icon: const Icon(Icons.add),
label: const Padding(
padding: EdgeInsets.symmetric(
vertical: 17,
),
child: Text(
'مشروع جديد',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
),
style: FilledButton.styleFrom(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
),
),

const SizedBox(height: 12),

// SELECT VIDEO
OutlinedButton.icon(
onPressed: () => _pickVideo(context),
icon: const Icon(
Icons.video_library_outlined,
),
label: const Padding(
padding: EdgeInsets.symmetric(
vertical: 15,
),
child: Text(
'اختيار فيديو من الجهاز',
),
),
style: OutlinedButton.styleFrom(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
),
),

const SizedBox(height: 24),
],
),
),
),
),
);
}
}

// ============================================================
// EDITOR
// ============================================================

class EditorScreen extends StatefulWidget {
  final File source;

  const EditorScreen({
    super.key,
    required this.source,
  });

@override
State<EditorScreen> createState() =>
_EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late VideoPlayerController controller;

  bool ready = false;
  bool exporting = false;

  double start = 0.0;
  double end = 1.0;

  double speed = 1.0;
  double volume = 1.0;

  String filter = 'original';
  String ratio = 'original';

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.file(
    widget.source,
  );

  controller.initialize().then((_) {
    if (!mounted) return;

    setState(() {
      ready = true;
    });
});

controller.addListener(() {
  if (mounted) {
    setState(() {});
  }
});
}

@override
void dispose() {
  controller.dispose();
  super.dispose();
}

// ==========================================================
// VIDEO INFORMATION
// ==========================================================

Duration get duration {
  return controller.value.duration;
}

double get durationSeconds {
  return duration.inMilliseconds / 1000.0;
}

// ==========================================================
// TIME FORMAT
// ==========================================================

String formatTime(Duration duration) {
  final minutes =
  duration.inMinutes.remainder(60)
  .toString()
  .padLeft(2, '0');

  final seconds =
  duration.inSeconds.remainder(60)
  .toString()
  .padLeft(2, '0');

  return '$minutes:$seconds';
}

// ==========================================================
// SEEK
// ==========================================================

void seek(double value) {
  if (!ready) return;

  final seconds =
  value * durationSeconds;

  controller.seekTo(
  Duration(
  milliseconds:
  (seconds * 1000).round(),
),
);
}

// ==========================================================
// EXPORT
// ==========================================================

Future<String> exportVideo() async {
  final directory =
  await getTemporaryDirectory();

  final output =
  '${directory.path}/vidora_${DateTime.now().millisecondsSinceEpoch}.mp4';

  final startSeconds =
  (start * durationSeconds)
  .toStringAsFixed(3);

  final endSeconds =
  (end * durationSeconds)
  .toStringAsFixed(3);

  final lengthSeconds =
  ((end - start) * durationSeconds)
  .toStringAsFixed(3);

  final videoFilters = <String>[];

  // FILTERS
  if (filter == 'vivid') {
    videoFilters.add(
    'eq=contrast=1.12:saturation=1.25:brightness=0.02',
  );
}

if (filter == 'mono') {
  videoFilters.add(
  'hue=s=0',
);
}

if (filter == 'warm') {
  videoFilters.add(
  'colorbalance=rs=.08:gs=.02:bs=-.03',
);
}

if (filter == 'cool') {
  videoFilters.add(
  'colorbalance=rs=-.03:gs=.02:bs=.08',
);
}

if (filter == 'cinema') {
  videoFilters.add(
  'eq=contrast=1.15:saturation=1.08:brightness=-.02',
);
}

// RATIO
if (ratio == '9:16') {
  videoFilters.add(
  'crop=ih*9/16:ih',
);
}

if (ratio == '1:1') {
  videoFilters.add(
  'crop=ih:ih',
);
}

final String filterCommand =
videoFilters.isEmpty
? ''
: '-vf "${videoFilters.join(',')}"';

final command =
'-y '
'-ss $startSeconds '
'-i "${widget.source.path}" '
'-t $lengthSeconds '
'$filterCommand '
'-filter_complex '
'"[0:v]setpts=PTS/$speed[v]" '
'-map "[v]" '
'-map 0:a? '
'-af "atempo=$speed,volume=$volume" '
'-c:v libx264 '
'-preset veryfast '
'-crf 23 '
'-c:a aac '
'"$output"';

final session =
await FFmpegKit.execute(command);

final code =
await session.getReturnCode();

if (ReturnCode.isSuccess(code)) {
  return output;
}

throw Exception(
'فشل تصدير الفيديو: $code',
);
}

// ==========================================================
// EXPORT BUTTON
// ==========================================================

Future<void> doExport() async {
  if (!ready || exporting) return;

  setState(() {
    exporting = true;
  });

try {
  final path = await exportVideo();

  if (!mounted) return;

  await showModalBottomSheet(
  context: context,
  showDragHandle: true,
  builder: (_) {
    return Directionality(
    textDirection: TextDirection.rtl,
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    const Icon(
    Icons.check_circle,
    size: 60,
    color: Colors.greenAccent,
  ),

  const SizedBox(height: 14),

  const Text(
  'تم تصدير الفيديو بنجاح',
  style: TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

Text(
path,
textAlign: TextAlign.center,
style: const TextStyle(
color: Colors.white54,
fontSize: 12,
),
),

const SizedBox(height: 20),

FilledButton.icon(
onPressed: () {
  Share.shareXFiles(
  [
  XFile(path),
],
text:
'فيديو من تطبيق Vidora',
);
},
icon: const Icon(
Icons.share,
),
label: const Text(
'مشاركة الفيديو',
),
),
],
),
),
),
);
},
);
} catch (e) {
if (!mounted) return;

ScaffoldMessenger.of(context)
.showSnackBar(
SnackBar(
content: Text(
'حدث خطأ أثناء التصدير\n$e',
),
),
);
} finally {
if (mounted) {
  setState(() {
    exporting = false;
  });
}
}
}

// ==========================================================
// BUILD
// ==========================================================

@override
Widget build(BuildContext context) {
  if (!ready) {
    return const Scaffold(
    body: Center(
    child: CircularProgressIndicator(),
  ),
);
}

return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
appBar: AppBar(
title: const Text(
'تحرير الفيديو',
),
centerTitle: true,

leading: IconButton(
onPressed: () {
  Navigator.pop(context);
},
icon: const Icon(
Icons.arrow_back,
),
),

actions: [
if (exporting)
const Padding(
padding: EdgeInsets.all(14),
child: SizedBox(
width: 21,
height: 21,
child: CircularProgressIndicator(
strokeWidth: 2,
),
),
)
else
TextButton(
onPressed: doExport,
child: const Text(
'تصدير',
),
),
],
),

body: Column(
children: [
Expanded(
child: buildPreview(),
),

buildTimeline(),

buildTools(),
],
),
),
);
}

// ==========================================================
// PREVIEW
// ==========================================================

Widget buildPreview() {
  double aspectRatio;

  if (ratio == '9:16') {
    aspectRatio = 9 / 16;
  } else if (ratio == '1:1') {
  aspectRatio = 1;
} else {
aspectRatio =
controller.value.aspectRatio;
}

return Container(
margin: const EdgeInsets.fromLTRB(
12,
8,
12,
8,
),

decoration: BoxDecoration(
color: Colors.black,
borderRadius:
BorderRadius.circular(18),
),

clipBehavior: Clip.antiAlias,

child: Center(
child: AspectRatio(
aspectRatio: aspectRatio,

child: Stack(
fit: StackFit.expand,

children: [
VideoPlayer(
controller,
),

// FILTER PREVIEW
if (filter != 'original')
IgnorePointer(
child: Container(
color:
filterTint(filter),
),
),

// PLAY BUTTON
Center(
child: IconButton.filled(
onPressed: () {
  if (controller
  .value
  .isPlaying) {
    controller.pause();
  } else {
  controller.play();
}
},

icon: Icon(
controller
.value
.isPlaying
? Icons.pause
: Icons.play_arrow,
),
),
),

// TIME
Positioned(
left: 12,
bottom: 12,
child: Container(
padding:
const EdgeInsets.symmetric(
horizontal: 9,
vertical: 5,
),

decoration: BoxDecoration(
color: Colors.black54,
borderRadius:
BorderRadius.circular(10),
),

child: Text(
formatTime(
controller
.value
.position,
),
),
),
),
],
),
),
),
);
}

// ==========================================================
// FILTER PREVIEW COLOR
// ==========================================================

Color filterTint(String name) {
  switch (name) {
    case 'warm':
    return Colors.orange.withOpacity(.10);

    case 'cool':
    return Colors.blue.withOpacity(.10);

    case 'mono':
    return Colors.grey.withOpacity(.18);

    case 'vivid':
    return Colors.purple.withOpacity(.06);

    case 'cinema':
    return Colors.amber.withOpacity(.05);

    default:
    return Colors.transparent;
  }
}

// ==========================================================
// TIMELINE
// ==========================================================

Widget buildTimeline() {
  final current =
  controller
  .value
  .position
  .inMilliseconds /
  (durationSeconds * 1000);

  return Padding(
  padding: const EdgeInsets.fromLTRB(
  14,
  0,
  14,
  5,
),

child: Column(
children: [
Row(
children: [
Text(
formatTime(
Duration(
milliseconds:
(start *
durationSeconds *
1000)
.round(),
),
),
),

const Spacer(),

Text(
formatTime(
Duration(
milliseconds:
(end *
durationSeconds *
1000)
.round(),
),
),
),
],
),

// RANGE
RangeSlider(
values: RangeValues(
start,
end,
),

min: 0,
max: 1,

onChanged: (value) {
  setState(() {
    start = value.start;
    end = value.end;
  });
},

onChangeEnd: (_) {
  seek(start);
},
),

// PLAYHEAD
Slider(
value: current.clamp(
0.0,
1.0,
),

onChanged: seek,
),
],
),
);
}

// ==========================================================
// TOOLS
// ==========================================================

Widget buildTools() {
  return SizedBox(
  height: 158,

  child: Column(
  children: [