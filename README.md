<p align="center">
<img src="https://user-images.githubusercontent.com/42299721/150039268-bba167fe-c7de-471a-9587-565308d71f20.gif" alt="logo" width="60%" />
</p>

<p align="center">
<img src="https://img.shields.io/github/license/ezranbayantemur/react-native-rtmp-publisher" alt="github/license" />
<img src="https://img.shields.io/github/issues/ezranbayantemur/react-native-rtmp-publisher" alt="github/issues" />
<img src="https://img.shields.io/github/issues-pr/ezranbayantemur/react-native-rtmp-publisher" alt="github/issues-pr" />
<img src="https://img.shields.io/npm/dw/react-native-rtmp-publisher" alt="npm/dw" />
<img src="https://img.shields.io/github/followers/ezranbayantemur?style=social" alt="github/followers" />
<img src="https://img.shields.io/github/stars/ezranbayantemur/react-native-rtmp-publisher?style=social" alt="github/stars" />
<img src="https://img.shields.io/github/forks/ezranbayantemur/react-native-rtmp-publisher?style=social" alt="github/forks" />
</p>

📹 Live stream RTMP publisher for React Native with built in camera support!

## Installation

```sh
npm install react-native-rtmp-publisher
```

or

```sh
yarn add react-native-rtmp-publisher
```

for iOS, on `/ios` directory

```sh
pod install
```

## Example Project

Clone the repo and on `/example` directory

```sh
yarn
```

and

```sh
yarn ios (or yarn android)
```

You can use Youtube for live stream server. You can check [Live on Youtube](https://support.google.com/youtube/answer/2474026?hl=tr&ref_topic=9257984)

## Usage

### Android

Add Android Permission for camera and audio to `AndroidManifest.xml`

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

### iOS

Add iOS Permission for camera and audio to `Info.plist`

```xml
<key>NSCameraUsageDescription</key>
 <string>CAMERA PERMISSION DESCRIPTION</string>
<key>NSMicrophoneUsageDescription</key>
 <string>AUDIO PERMISSION DESCRIPTION</string>
```

### React Native

```js
import { RTMPPublisher } from 'react-native-rtmp-publisher';

// ...

async function publisherActions() {
  await publisherRef.current.startStream();
  await publisherRef.current.stopStream();
  await publisherRef.current.mute();
  await publisherRef.current.unmute();
  await publisherRef.current.switchCamera();
  await publisherRef.current.getPublishURL();
  await publisherRef.current.isMuted();
  await publisherRef.current.isStreaming();
  await publisherRef.current.toggleFlash();
  await publisherRef.current.hasCongestion();
  await publisherRef.current.isAudioPrepared();
  await publisherRef.current.isVideoPrepared();
  await publisherRef.current.isCameraOnPreview();
}

<RTMPPublisher
  ref={publisherRef}
  streamURL="rtmp://your-publish-url"
  streamName="stream-name"
  onConnectionFailedRtmp={() => null}
  onConnectionStartedRtmp={() => null}
  onConnectionSuccessRtmp={() => null}
  onDisconnectRtmp={() => null}
  onNewBitrateRtmp={() => null}
  onStreamStateChanged={(s: streamState) => null}
/>;
```

## Props

|     Name     |   Type   | Required |              Description              |
| :----------: | :------: | :------: | :-----------------------------------: |
| `streamURL`  | `string` |  `true`  | Publish URL address with RTM Protocol |
| `streamName` | `string` |  `true`  |          Stream name or key           |

### Youtube Example

For live stream, Youtube gives you stream url and stream key, you can place the key on `streamName` parameter

**Youtube Stream URL:** `rtmp://a.rtmp.youtube.com/live2`

**Youtube Stream Key:** `****-****-****-****-****`

```js
<RTMPPublisher
  streamURL="rtmp://a.rtmp.youtube.com/live2"
  streamName="****-****-****-****-****"
  ...
  ...
```

## Events

|          Name          |    Returns    |                                        Description                                        |   Platform   |
| :--------------------: | :-----------: | :---------------------------------------------------------------------------------------: | :----------: |
|  `onConnectionFailed`  |    `null`     |                        Invokes on connection fails to publish URL                         |     Both     |
| `onConnectionStarted`  |    `null`     |                        Invokes on connection start to publish URL                         |     Both     |
| `onConnectionSuccess`  |    `null`     |                       Invokes on connection success to publish URL                        |     Both     |
|     `onDisconnect`     |    `null`     |                          Invokes on disconnect from publish URL                           |     Both     |
| `onNewBitrateReceived` |    `null`     |                         Invokes on new bitrate received from URL                          | Only Android |
| `onStreamStateChanged` | `streamState` | Invokes on stream state changes. It can be use alternatively for above connection events. |     Both     |

## Methods

|        Name         |      Returns       |         Description         |   Platform   |
| :-----------------: | :----------------: | :-------------------------: | :----------: |
|    `startStream`    |  `Promise<null>`   |      Starts the stream      |     Both     |
|    `stopStream`     |  `Promise<null>`   |      Stops the stream       |     Both     |
|       `mute`        |  `Promise<null>`   |    Mutes the microphone     |     Both     |
|      `unmute`       |  `Promise<null>`   |   Unmutes the microphone    |     Both     |
|   `switchCamera`    |  `Promise<null>`   |     Switches the camera     |     Both     |
|   `getPublishURL`   | `Promise<string>`  |    Gets the publish URL     |     Both     |
|      `isMuted`      | `Promise<boolean>` |  Returns microphone state   |     Both     |
|    `isStreaming`    | `Promise<boolean>` |   Returns streaming state   |     Both     |
|   `toggleFlash`     | `Promise<boolean>` |    Toggles the flash        |     Both     |
|   `hasCongestion`   | `Promise<boolean>` |    Returns if congestion    | Only Android |
|  `isAudioPrepared`  | `Promise<boolean>` | Returns audio prepare state |     Both     |
|  `isVideoPrepared`  | `Promise<boolean>` | Returns video prepare state |     Both     |
| `isCameraOnPreview` | `Promise<boolean>` |    Returns camera is on     | Only Android |

## Types

| Name          |                      Value                       |
| ------------- | :----------------------------------------------: |
| `streamState` | `CONNECTING` `CONNECTED` `DISCONNECTED` `FAILED` |

## Used Native Packages

- Android: [rtmp-rtsp-stream-client-java](https://github.com/pedroSG94/rtmp-rtsp-stream-client-java)
- iOS: [HaishinKit.swift](https://github.com/shogo4405/HaishinKit.swift)

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
