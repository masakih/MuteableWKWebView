//
//  getPage.c
//  TestSounds
//
//  Created by Hori,Masaki on 2017/05/20.
//  Copyright © 2017年 Hori,Masaki. All rights reserved.
//

#include "getPage.h"

#include <objc/runtime.h>
#include <stdio.h>
#include <string.h>

#if __has_feature(objc_arc)
#error This file must be compiled without ARC
#endif

void *getPage(id instance) {
    
    static const char *pagePropertyName = "_page";
    static bool foundPageProperty = false;
    
    Class classObj = object_getClass(instance);
    unsigned int c = 0;
    Ivar *ivarP = class_copyIvarList(classObj, &c);
    
    if( !foundPageProperty ) {
        for(int i = 0; i < c; i++) {
            const char *ivarName = ivar_getName(ivarP[i]);
            if( strncmp(pagePropertyName, ivarName, 5) == 0 ) {
                foundPageProperty = true;
                break;
            }
        }
    }
    if( !foundPageProperty ) {
        return NULL;
    }
    
    Ivar ivar = class_getInstanceVariable(classObj, pagePropertyName);
    void *ptr = object_getIvar(instance, ivar);
    
    return ptr;
}
