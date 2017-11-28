//
//  UIBarItem+SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOLocalizationElement.h"

@interface UIBarItem (SOLocalization)<SOLocalizationElement>

@property (copy, nonatomic) NSString *sol_title;
@property (copy, nonatomic) NSString *sol_table;

@end
