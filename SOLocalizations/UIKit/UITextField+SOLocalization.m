//
//  UITextField+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UITextField+SOLocalization.h"
#import <objc/runtime.h>
#import "SOLocalization.h"

@implementation UITextField (SOLocalization)

- (NSString *)sol_placeholder {
    return objc_getAssociatedObject(self, @selector(sol_placeholder));
}

- (void)setSol_placeholder:(NSString *)sol_placeholder {
    objc_setAssociatedObject(self, @selector(sol_placeholder), [sol_placeholder copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}

- (void)sol_updateLocalization {
    [super sol_updateLocalization];
    if (self.sol_placeholder) {
        self.placeholder = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_placeholder inTable:self.sol_table];
    }
}

@end
