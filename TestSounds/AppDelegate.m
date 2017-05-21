//
//  AppDelegate.m
//  TestSounds
//
//  Created by Hori,Masaki on 2016/12/15.
//  Copyright © 2016年 Hori,Masaki. All rights reserved.
//

#import "AppDelegate.h"

#import "WindowController.h"


@interface AppDelegate ()

@property NSMutableArray<WindowController *> *controllers;

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    self.controllers = [NSMutableArray array];
    
    [self newWindow:nil];
}

- (IBAction)newWindow:(id)sender
{
    WindowController *wc = [[WindowController alloc] initWithURLString:@"https://www.youtube.com"];
    [self.controllers addObject:wc];
    
    [wc showWindow:nil];
}

@end
