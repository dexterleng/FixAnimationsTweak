# FixAnimationsTweak

Disabling animations in Mac apps using code injection.

Read the blog post [here](https://dexterleng.com/posts/code-injection/).

## Get Started

```
swift build --triple arm64e-apple-macosx14.0.0
DYLD_INSERT_LIBRARIES=./.build/arm64e-apple-macosx/debug/libFixAnimationsTweak.dylib /Applications/Safari.app/Contents/MacOS/Safari
```