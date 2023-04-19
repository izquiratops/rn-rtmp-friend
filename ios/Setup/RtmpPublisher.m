#import "RtmpPublisher.h"
#import <AVFoundation/AVFoundation.h>

@implementation RtmpPublisher

+ (void)setup {
    NSLog(@"Setting up RtmpPublisher");

    AVAudioSession *session = AVAudioSession.sharedInstance;
    NSError *error = nil;

    if (@available(iOS 10.0, *)) {
        BOOL success = [session
          setCategory:AVAudioSessionCategoryPlayAndRecord
          mode:AVAudioSessionModeVoiceChat
          options:AVAudioSessionCategoryOptionDefaultToSpeaker|AVAudioSessionCategoryOptionAllowBluetooth
          error:&error];
        
        if (!success || error) {
            NSLog(@"RtmpPublisher: Error setting category and audio mode: %@", error.localizedDescription);
            return;
        }
    } else {
        SEL selector = NSSelectorFromString(@"setCategory:withOptions:error:");
      
        NSArray *optionsArray = @[
            @(AVAudioSessionCategoryOptionAllowBluetooth),
            @(AVAudioSessionCategoryOptionDefaultToSpeaker)
        ];
      
        BOOL success = (BOOL)[session
          performSelector:selector
          withObject:AVAudioSessionCategoryPlayAndRecord
          withObject:optionsArray];
        
        if (!success) {
            NSLog(@"RtmpPublisher: Error setting category with options");
            return;
        }
      
        success = [session setMode:AVAudioSessionModeVoiceChat error:&error];
        if (!success || error) {
            NSLog(@"RtmpPublisher: Error setting session mode: %@", error.localizedDescription);
            return;
        }
    }
  
    BOOL success = [session setActive:YES error:&error];
    if (!success || error) {
        NSLog(@"RtmpPublisher: Error setting audio session active: %@", error.localizedDescription);
    }
}

@end
