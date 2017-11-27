//
//  SOSwizzle.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void SOSwizzleMethod(Class originalCls, SEL originalSelector, Class swizzledCls, SEL swizzledSelector);
