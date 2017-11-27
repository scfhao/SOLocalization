//
//  UIBarItem+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UIBarItem+SOLocalization.h"
#import <objc/runtime.h>
#import "SOLocalization.h"

@implementation UIBarItem (SOLocalization)

- (NSString *)sol_title {
    return objc_getAssociatedObject(self, @selector(sol_title));
}

- (void)setSol_title:(NSString *)sol_title {
    objc_setAssociatedObject(self, @selector(sol_title), [sol_title copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}

- (void)setSol_table:(NSString *)sol_table {
    objc_setAssociatedObject(self, @selector(sol_table), [sol_table copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}

- (NSString *)sol_table {
    return objc_getAssociatedObject(self, @selector(sol_table));
}

- (void)sol_updateLocalization {
    if (self.sol_title) {
        self.title = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_title inTable:self.sol_table];
    }
}

@end
