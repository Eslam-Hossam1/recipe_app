# Add ProGuard rules here
# The code below keeps the names of your classes and methods
-keep class com.example.recipe_app.** { *; }

# Keep Flutter plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }

# Keep Firebase Analytics
-keep class com.google.firebase.analytics.** { *; }
