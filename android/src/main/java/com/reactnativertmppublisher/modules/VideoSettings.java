package com.reactnativertmppublisher.modules;

public class VideoSettings {
  public int width;
  public int height;
  public int bitrate;
  public int audioBitrate;

  public VideoSettings(int width, int height, int bitrate, int audioBitrate) {
    this.width = width;
    this.height = height;
    this.bitrate = bitrate;
    this.audioBitrate = audioBitrate;
  }
  
  public static VideoSettings getDefault() {
    return new VideoSettings(720, 1280, 3000 * 1024, 128 * 1024);
  }
}
