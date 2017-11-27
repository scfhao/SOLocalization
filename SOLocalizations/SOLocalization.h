//
//  SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+SOLocalization.h"
#import "UILabel+SOLocalization.h"
#import "UIButton+SOLocalization.h"
#import "UITextField+SOLocalization.h"
#import "UIViewController+SOLocalizations.h"
#import "UINavigationItem+SOLocalization.h"
#import "UIBarItem+SOLocalization.h"

@interface SOLocalization : NSObject

@property (copy, nonatomic) NSString *region;

+ (instancetype)sharedLocalization;
- (NSString *)localizedStringForKey:(NSString *)key inTable:(NSString *)table;

@end

#pragma mark - Common Regions

FOUNDATION_EXPORT NSString * const SOLocalizationEnglish;
FOUNDATION_EXPORT NSString * const SOLocalizationSimplifiedChinese;
FOUNDATION_EXPORT NSString * const SOLocalizationTraditionalChinese;
