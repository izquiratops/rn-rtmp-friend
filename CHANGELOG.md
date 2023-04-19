## [v0.4.15]

### Features
- Added videoOrientation to set initial video orientation

## [v0.4.14]

### Features
- Added allowedVideoOrientations

## [v0.4.13]

### Features
- Automatic video orientation changes
- Refactored setup of the library for ios

## [v0.4.12]

### Features
- setVideoSettings method, with which you can setup your needed video quality
- videoSettings prop - does the same as setVideoSettings, but useful, when you need just default video setting
- added fix for 2nd stream reconnection based on this one https://github.com/ezranbayantemur/react-native-rtmp-publisher/pull/35
- added listener for CLOSED status (useful, when the stream closed and you need to listen to that and act accordingly)
- added fix for green dot, when screen is unmounted, based on this one https://github.com/ezranbayantemur/react-native-rtmp-publisher/pull/36
- changed yarn to pnpm, because it is faster and has autocomplete in it
- added some useful scripts in the package.json to easy local testing of the library
- fixed styling for tsconfig