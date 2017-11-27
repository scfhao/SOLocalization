//
//  UIView+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UIView+SOLocalization.h"
#import "SOLocalization.h"
#import <objc/runtime.h>

@implementation UIView (SOLocalization)

- (void)sol_updateLocalization {
    [[self subviews]makeObjectsPerformSelector:@selector(sol_updateLocalization)];
}

- (void)setSol_table:(NSString *)sol_table {
    objc_setAssociatedObject(self, @selector(sol_table), [sol_table copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}

- (NSString *)sol_table {
    return objc_getAssociatedObject(self, @selector(sol_table));
}

@end
