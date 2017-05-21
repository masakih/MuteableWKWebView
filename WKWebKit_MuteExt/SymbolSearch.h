//
//  SymbolSearch.h
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/21.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#ifndef SymbolSearch_h
#define SymbolSearch_h

#import <Foundation/Foundation.h>

/**
 Description

 @param imagePath image path that search in.
 @param hints hint of function name or class name.
 @return return symbol name. return nil if not found.
 */
NSString *symbolSearch(NSString* imagePath, NSArray<NSString *> *hints);

#endif /* SymbolSearch_h */
