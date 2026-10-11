# Flutter Rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep Flutter main entry & engine
-keep class com.fitman.app.** { *; }
-keep class com.gymmane.app.** { *; }

# Firebase Rules
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keepclassmembers enum * { *; }

# Desugar JDK Libs
-keep class java.time.** { *; }

# Play Core deferred components
-dontwarn com.google.android.play.core.**
