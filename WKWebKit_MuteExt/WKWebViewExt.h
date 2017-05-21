//
//  WKWebViewExt.h
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/21.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#import <WebKit/WebKit.h>

typedef NS_OPTIONS(NSInteger, _WKMediaMutedState) {
    _WKMediaNoneMuted = 0,
    _WKMediaAudioMuted = 1 << 0,
    _WKMediaCaptureDevicesMuted = 1 << 1,
};


@interface WKWebView (HMMuteExtension)

@property _WKMediaMutedState mute;

@end
