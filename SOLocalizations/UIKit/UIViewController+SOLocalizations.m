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

- (void)sol_updateLocalization {
    [self.navigationItem sol_updateLocalization];
    [self.tabBarItem sol_updateLocalization];
    [self.childViewControllers makeObjectsPerformSelector:@selector(sol_updateLocalization)];
}

@end
