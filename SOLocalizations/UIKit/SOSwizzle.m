//
//  SOSwizzle.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "SOSwizzle.h"
#import <objc/runtime.h>


void SOSwizzleClassMethod(Class clz, SEL originalSelector, SEL swizzledSelector) {
    Class originalMetaClz = object_getClass(clz);
    Class swizzledMetaClz = object_getClass(clz);
    
    Method originalMethod = class_getClassMethod(originalMetaClz, originalSelector);
    Method swizzledMethod = class_getClassMethod(swizzledMetaClz, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(originalMetaClz,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(originalMetaClz,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void SOSwizzleInstanceMethod(Class clz, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(clz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clz, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(clz,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(clz,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
