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
#import "SOSwizzle.h"

@interface UIButton (_SOLocalization)

@property (strong, nonatomic) NSMutableDictionary *sol_titleDictionary;

@end

@implementation UIButton (SOLocalization)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SOSwizzleMethod([self class], @selector(titleForState:), [self class], @selector(sol_titleForState:));
    });
}

- (NSMutableDictionary *)sol_titleDictionary {
    NSMutableDictionary *titleDictionary = objc_getAssociatedObject(self, @selector(sol_titleDictionary));
    if (!titleDictionary) {
        titleDictionary = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, @selector(sol_titleDictionary), titleDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return titleDictionary;
}

- (NSString *)sol_titleForState:(UIControlState)state {
    NSString *sol_title = self.sol_titleDictionary[@(self.state)];
    if (sol_title) {
        return [[SOLocalization sharedLocalization]localizedStringForKey:sol_title inTable:self.sol_table];
    } else {
        return [self sol_titleForState:state];
    }
}

- (void)sol_setTitle:(NSString *)title forState:(UIControlState)state {
    self.sol_titleDictionary[@(state)] = title;
    NSString *localizedTitle = [[SOLocalization sharedLocalization]localizedStringForKey:title inTable:self.sol_table];
    [self setTitle:localizedTitle forState:state];
}

- (void)sol_updateLocalization {
    [super sol_updateLocalization];
    NSString *sol_title = self.sol_titleDictionary[@(self.state)];
    if (sol_title) {
        NSString *localizedTitle = [[SOLocalization sharedLocalization]localizedStringForKey:sol_title inTable:self.sol_table];
        [self setTitle:localizedTitle forState:self.state];
    }
}

@end
