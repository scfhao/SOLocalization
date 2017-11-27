//
//  UIViewController+SOLocalizations.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UIViewController+SOLocalizations.h"
#import <objc/runtime.h>
#import "SOLocalization.h"
#import "UINavigationItem+SOLocalization.h"
#import "UIBarItem+SOLocalization.h"
#import "SOSwizzle.h"

@implementation UIViewController (SOLocalizations)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SOSwizzleMethod([self class], @selector(viewWillAppear:), [self class], @selector(sol_viewWillAppear:));
    });
}

- (void)sol_viewWillAppear:(BOOL)animated {
    [self sol_viewWillAppear:animated];
    [self.view sol_updateLocalization];
    [self sol_updateLocalization];
}

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
    self.title = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_title inTable:self.sol_table];
    [self.navigationItem sol_updateLocalization];
    [self.tabBarItem sol_updateLocalization];
    [self.childViewControllers makeObjectsPerformSelector:@selector(sol_updateLocalization)];
}

@end
