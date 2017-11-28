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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (NSString *)titleForState:(UIControlState)state {
    NSString *solTitle = self.sol_titleDictionary[@(state)];
    return [[SOLocalization sharedLocalization]localizedStringForKey:solTitle inTable:self.sol_table];
}
#pragma clang diagnostic pop

- (void)sol_updateLocalization {
    NSString *title = [self titleForState:self.state];
    [self setTitle:title forState:self.state];
}

@end
