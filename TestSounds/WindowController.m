//
//  WindowController.m
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/17.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#import "WindowController.h"

#import "WKWebViewExt.h"

@interface WindowController ()
@property BOOL mute;

@property (strong) WKWebView *webView;

@property (weak) IBOutlet NSView *webViewPlaceholer;
@property (copy) NSURL *url;

@end

@implementation WindowController

+ (instancetype)new
{
    return [self windowControllerWithURL:[NSURL URLWithString:@"http://pc-play.games.dmm.co.jp/play/flower-x"]];
}
+ (instancetype)windowControllerWithURL:(NSURL *)aURL
{
    return [[self alloc] initWithURL:aURL];
}
+ (instancetype)widowControllerWithURLString:(NSString *)string
{
    return [[self alloc] initWithURLString:string];
}
- (instancetype)initWithURLString:(NSString *)string
{
    return [self initWithURL:[NSURL URLWithString:string]];
}
- (instancetype)initWithURL:(NSURL *)anURL
{
    self = [super initWithWindowNibName:NSStringFromClass([self class])];
    if(self) {
        self.url = anURL;
    }
    return self;
}

- (void)makeWebView
{
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    WKPreferences *pref = [WKPreferences new];
    pref.plugInsEnabled = YES;
    config.preferences = pref;
    
    NSRect frame = self.webViewPlaceholer.frame;
    
    self.webView = [[WKWebView alloc] initWithFrame:frame configuration:config];
    
    self.webView.autoresizingMask = self.webViewPlaceholer.autoresizingMask;
    [self.webViewPlaceholer.superview replaceSubview:self.webViewPlaceholer
                                                with:self.webView];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self makeWebView];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:req];
    
}

- (void)setMute:(BOOL)mute
{
    self.webView.isMuted = mute;
}
- (BOOL)mute {
    return self.webView.isMuted;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingButtonLabel {
    return [NSSet setWithObject:@"mute"];
}
- (NSString *)buttonLabel
{
    return self.mute ? @"Unmute" : @"Mute";
}

- (IBAction)mute:(id)sender
{
    self.mute = !self.mute;
}

@end
