//
//  WKWebViewExt.h
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/21.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#import <WebKit/WebKit.h>


@interface WKWebView (HMMuteExtension)

@property (getter=isMuted) BOOL muted;

@end
