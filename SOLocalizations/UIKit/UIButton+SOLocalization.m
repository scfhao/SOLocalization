//
//  UIButton+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UIButton+SOLocalization.h"
#import "SOLocalization.h"
#import <objc/runtime.h>

@interface UIButton (_SOLocalization)

@property (strong, nonatomic) NSMutableDictionary *sol_titleDictionary;

@end

@implementation UIButton (SOLocalization)

- (NSMutableDictionary *)sol_titleDictionary {
    NSMutableDictionary *titleDictionary = objc_getAssociatedObject(self, @selector(sol_titleDictionary));
    if (!titleDictionary) {
        titleDictionary = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, @selector(sol_titleDictionary), titleDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return titleDictionary;
}

- (void)sol_setTitle:(NSString *)title forState:(UIControlState)state {
    self.sol_titleDictionary[@(state)] = title;
    [self sol_updateLocalization];
}

- (void)sol_updateLocalization {
    NSString *sol_title = self.sol_titleDictionary[@(self.state)];
    if (sol_title) {
        NSString *localizedTitle = [[SOLocalization sharedLocalization]localizedStringForKey:sol_title inTable:self.sol_table];
        [self setTitle:localizedTitle forState:self.state];
    }
}

@end
