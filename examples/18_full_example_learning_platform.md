# Example 18: Full Example - Learning Platform

## سوال
یک پلتفرم آموزشی ساده بساز:

- کلاس انتزاعی `Content` با متد `render()`
- کلاس های `VideoCourse` و `Article` به عنوان وراثت
- با `List<Content>` رندر چندریختی
- پیشرفت دانشجو private باشد (کپسولیشن)
- با `mixin` رویدادها لاگ شوند

## راهنمای مرحله‌ای
1. `mixin EventLogger` بساز.
2. کلاس `abstract Content` با `title` و `render()` تعریف کن.
3. دو کلاس فرزند برای محتوا بساز.
4. کلاس `StudentProgress` با فیلد private و متد کنترل شده پیاده سازی کن.
5. در `main` محتواها را رندر و پیشرفت را آپدیت کن.

## جواب کامل (Dart)
```dart
mixin EventLogger {
  void logEvent(String text) => print('[EVENT] $text');
}

abstract class Content with EventLogger {
  String title;
  Content(this.title);

  void render();
}

class VideoCourse extends Content {
  int durationMinutes;
  VideoCourse(String title, this.durationMinutes) : super(title);

  @override
  void render() {
    logEvent('Play video: $title ($durationMinutes min)');
  }
}

class Article extends Content {
  int wordCount;
  Article(String title, this.wordCount) : super(title);

  @override
  void render() {
    logEvent('Open article: $title ($wordCount words)');
  }
}

class StudentProgress {
  int _completedPercent = 0;

  int get completedPercent => _completedPercent;

  void updateProgress(int newPercent) {
    if (newPercent < _completedPercent || newPercent > 100) return;
    _completedPercent = newPercent;
  }
}

void main() {
  final contents = <Content>[
    VideoCourse('Dart OOP', 45),
    Article('Mixin in Practice', 1200),
  ];

  final progress = StudentProgress();

  for (final c in contents) {
    c.render();
  }

  progress.updateProgress(40);
  print('Progress: ${progress.completedPercent}%');
  progress.updateProgress(75);
  print('Progress: ${progress.completedPercent}%');
}
```
