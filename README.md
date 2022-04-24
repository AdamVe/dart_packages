Example of dart packages
===

Demonstrates problem with `pubspec.lock` not preserving paths for local path based dependencies.
This simple example adds dependency to two packages:
- `local` - relative location 
- `git_based` - git location

```
dependencies:
  local:
    path: packages/local

  git_based:
    git:
      url: https://github.com/AdamVe/dart_packages.git
      path: packages/git_based
      ref: 60af6ee
```

## Steps to reproduce the issue

1. Use win_64 dart `Dart SDK version: 2.17.0-266.5.beta (beta) (Mon Apr 18 17:50:42 2022 +0200) on "windows_x64"`
2. clone the beta branch of this project `git clone git@github.com:AdamVe/dart_packages.git -b beta`
3. run the progam:
```
cd dart_packages
dart run
```

The output will be similar to:
```
Resolving dependencies in .\dart_packages...
Got dependencies in .\dart_packages!
Building package executable...
Built dart_package_examples:dart_package_examples.
Result from local: 42!
Result from git_based: 42!
```

## What is expected to happen
Running `git diff` gives no change in any file.

## What happens
A change is create in the `pubspec.lock` file
```
diff --git a/pubspec.lock b/pubspec.lock
index bde86b3..61d648b 100644
--- a/pubspec.lock
+++ b/pubspec.lock
@@ -20,7 +20,7 @@ packages:
   local:
     dependency: "direct main"
     description:
-      path: "packages/local"
+      path: "packages\\local"
       relative: true
     source: path
     version: "1.0.0"
```

# dart stable
This repo contains a branch with dart stable as well

The **error does not exists in stable** 
1. switch to dart stable `Dart SDK version: 2.16.2 (stable) (Tue Mar 22 13:15:13 2022 +0100) on "windows_x64"`
2. checkout the stable branch, run the project and see git diff:

```
git clone git@github.com:AdamVe/dart_packages.git -b stable
cd dart_packages
dart run
git diff
```

# dart dev
This repo contains a branch with dart dev as well

The **error does not exists in dev** 
1. switch to dart dev `Dart SDK version: 2.18.0-44.0.dev (dev) (Fri Apr 22 02:54:38 2022 -0700) on "windows_x64"`
2. checkout the dev branch, run the project and see git diff:

```
git clone git@github.com:AdamVe/dart_packages.git -b dev
cd dart_packages
dart run
git diff
```
