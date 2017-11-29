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

#define SOLocalizedStringFromTable(key, tbl) \
[[SOLocalization sharedLocalization] localizedStringForKey:(key) inTable:(tbl)]

@interface SOLocalization : NSObject

/**
 当前使用的语言
 使用本地化文件夹的名称，比如英文的本地化文件夹叫 en.lproj，这里就用 en 代表英文，为了方便使用，本文件底部定义了 英文、简体中文、繁体中文 三个常量，可直接使用
 */
@property (copy, nonatomic) NSString *region;

/**
 设置支持的语言及默认语言
 如果当前系统中的语言包含在支持的语言数组中，则使用系统的语言，否则使用 fallbackRegion。注意此方法应该先于 SOLocalization 的其他方法执行，否则不起作用。
 */
+ (void)configSupportRegions:(NSArray *)supportRegions fallbackRegion:(NSString *)fallbackRegion;

/**
 获取一个单例对象，可以通过此对象获取或修改当前设置的语言
 */
+ (instancetype)sharedLocalization;

/**
 获取指定的 key 在当前语言环境下的本地化字符串。
 为方便使用，SOLocalization 提供了一系列 UIKit Category，方便对常见的 UIKit 元素设置本地化字符串内容，使用这种方式设置本地化字符串后，当 SOLocalization 中的语言变化时，UIKit 元素会自动切换其语言内容。
 @param key 使用的本地化（strings）文件中等号左边的字符串
 @param table 要使用的本地化文件名，传 nil 时使用 infoPlist.strings
 @see SOLocalizedStringFromTable(key, tbl)
 */
- (NSString *)localizedStringForKey:(NSString *)key inTable:(NSString *)table;

@end

#pragma mark - Common Regions

FOUNDATION_EXPORT NSString * const SOLocalizationEnglish;               /* 英文 */
FOUNDATION_EXPORT NSString * const SOLocalizationSimplifiedChinese;     /* 简体中文 */
FOUNDATION_EXPORT NSString * const SOLocalizationTraditionalChinese;    /* 繁体中文 */
