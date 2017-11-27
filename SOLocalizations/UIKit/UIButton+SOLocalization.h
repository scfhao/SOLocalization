//
//  UIButton+SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SOLocalization.h"

@interface UIButton (SOLocalization)

- (void)sol_setTitle:(NSString *)title forState:(UIControlState)state;

@end
