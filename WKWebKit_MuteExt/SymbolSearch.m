//
//  SymbolSearch.m
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/21.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SymbolSearch.h"

NSString *symbolSearch(NSString* imagePath, NSArray<NSString *> *hints) {
    
    NSDictionary<NSString *, NSString *> *env = @{@"LANG": @"C"};
    
    NSTask *nmTask = [NSTask new];
    nmTask.launchPath = @"/usr/bin/nm";
    nmTask.arguments = @[imagePath];
    nmTask.environment = env;
    
    NSPipe *nmPipe = [NSPipe pipe];
    nmTask.standardOutput = nmPipe;
    [nmTask launch];
    
    NSMutableArray<NSTask *> *taskStack = [NSMutableArray array];
    NSPipe *pipe = nmPipe;
    NSTask *lastTask = nil;
    for( NSString *hint in hints ) {
        NSTask *grepTask = [NSTask new];
        [taskStack addObject:grepTask];
        grepTask.launchPath = @"/usr/bin/grep";
        grepTask.arguments = @[hint];
        grepTask.environment = env;
        
        grepTask.standardInput = pipe;
        pipe = [NSPipe pipe];
        grepTask.standardOutput = pipe;
        [grepTask launch];
        
        lastTask = grepTask;
    }
    
    [lastTask waitUntilExit];
    
    NSFileHandle *reading = pipe.fileHandleForReading;
    NSData *data = [reading readDataToEndOfFile];
    NSString *output = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    NSArray *lines = [output componentsSeparatedByString:@"\n"];
    for( NSString *line in lines ) {
        NSArray *cols = [line componentsSeparatedByString:@" "];
        if( cols.count != 0 ) {
            NSString *name = cols[cols.count - 1];
            if( name.length != 0 ) {
                return name;
            }
        }
    }
    
    return nil;
}
