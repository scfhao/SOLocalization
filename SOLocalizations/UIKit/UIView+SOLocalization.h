//
//  UIView+SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SOLocalizationElement

@optional
- (void)sol_updateLocalization;

@end

@interface UIView (SOLocalization)<SOLocalizationElement>

@property (copy, nonatomic) NSString *sol_table;

@end
