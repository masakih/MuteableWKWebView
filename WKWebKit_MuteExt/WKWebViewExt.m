//
//  WKWebViewExt.m
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/21.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#import "WKWebViewExt.h"

#import <objc/runtime.h>

#import "HTSymbolHook.h"
#include "getPage.h"

#import "SymbolSearch.h"


typedef void (*SetMuteFunc)(void*, NSInteger);

static const char *mutekey = "HMMuteKey";
static NSString *sSymbolName = nil;
static SetMuteFunc sMuteFunc = NULL;

@implementation WKWebView (HMMuteExtension)

NSString *symbolName() {
    if( sSymbolName ) return sSymbolName;
    
    static BOOL isFirst = YES;
    if( !isFirst ) return nil;
    isFirst = NO;
    
    NSArray<NSString *> *hints = @[@"WebPageProxy", @"setMuted"];
    sSymbolName = symbolSearch(@"/System/Library/Frameworks/WebKit.framework/WebKit", hints);
    return sSymbolName;
}

SetMuteFunc getSetMuteFunc() {
    if( sMuteFunc ) return sMuteFunc;
    
    static BOOL isFirst = YES;
    if( !isFirst ) return NULL;
    isFirst = NO;
    
    NSString *symName = symbolName();
    if( !symName ) return NULL;
    
    HTSymbolHook *hook = [HTSymbolHook symbolHookWithImageNameSuffix:@"/WebKit"];
    sMuteFunc = (SetMuteFunc)[hook symbolPtrWithSymbolName:symName];
    return sMuteFunc;
}

- (void)setMute:(_WKMediaMutedState)mute
{
    void *ptr = getPage(self);
    
    SetMuteFunc setMute = getSetMuteFunc();
    if( !ptr || !setMute ) {
        fprintf(stderr, "It can NOT mute on this Mac.\n");
        return;
    }
    setMute(ptr, mute);
    
    objc_setAssociatedObject(self, mutekey, [NSNumber numberWithInteger:mute], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (_WKMediaMutedState)mute {
    NSNumber *muteVal = objc_getAssociatedObject(self, mutekey);
    return muteVal.integerValue;
}

@end
