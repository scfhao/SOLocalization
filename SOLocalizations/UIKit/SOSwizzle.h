//
//  SOSwizzle.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @brief 替换类的类方法
 @param clz 要修改的类
 @param originalSelector 要替换的方法
 @param swizzledSelector 新的方法实现
 */
extern void SOSwizzleClassMethod(Class clz, SEL originalSelector, SEL swizzledSelector);

/**
 @brief 替换类的实例方法
 @param clz 要修改的类
 @param originalSelector 要替换的方法
 @param swizzledSelector 新的方法实现
 */
extern void SOSwizzleInstanceMethod(Class clz, SEL originalSelector, SEL swizzledSelector);
