//
//  SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "SOLocalization.h"

static NSString * const SOLocalizationRegionKey = @"SOLocalizationRegionKey";
static NSString * const SODeviceLocalizationRegionKey = @"AppleLanguages";

NSString * const SOLocalizationEnglish = @"en";
NSString * const SOLocalizationSimplifiedChinese = @"zh-Hans";
NSString * const SOLocalizationTraditionalChinese = @"zh-Hant";

@implementation SOLocalization

static SOLocalization *localization = nil;

+ (void)configSupportRegions:(NSArray *)supportRegions fallbackRegion:(NSString *)fallbackRegion {
    if (!localization) {
        @synchronized(self) {
            if (!localization) {
                localization = [[SOLocalization alloc]initWithSupportRegions:supportRegions fallbackRegion:fallbackRegion];
            }
        }
    } else {
        NSLog(@"[SOLocalization]: 请在程序入口处调用%@", NSStringFromSelector(_cmd));
    }
}

+ (instancetype)sharedLocalization {
    if (!localization) {
        @synchronized(self) {
            if (!localization) {
                localization = [[SOLocalization alloc]initWithSupportRegions:nil fallbackRegion:nil];
            }
        }
    }
    return localization;
}

- (instancetype)initWithSupportRegions:(NSArray *)supportRegions fallbackRegion:(NSString *)fallbackRegion {
    self = [super init];
    if (self) {
        NSString *region = [[NSUserDefaults standardUserDefaults]objectForKey:SOLocalizationRegionKey];
        if (region) {
            _region = region;
        } else {
            if (![supportRegions count]) {
                supportRegions = @[SOLocalizationEnglish, SOLocalizationSimplifiedChinese, SOLocalizationTraditionalChinese];
            }
            if (!fallbackRegion) {
                fallbackRegion = SOLocalizationEnglish;
            }
            NSArray *languageArray = [[NSUserDefaults standardUserDefaults]objectForKey:SODeviceLocalizationRegionKey];
            if ([languageArray count]) {
                NSString *preferrdLanguage = languageArray[0];
                for (NSString *language in supportRegions) {
                    if ([preferrdLanguage hasPrefix:language]) {
                        _region = language;
                        break;
                    }
                }
            }
            if (!_region) {
                _region = fallbackRegion;
            }
        }
    }
    return self;
}

- (void)setRegion:(NSString *)region {
    if ([_region isEqualToString:region]) return;
    _region = [region copy];
    [[NSUserDefaults standardUserDefaults]setObject:region forKey:SOLocalizationRegionKey];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window sol_updateLocalization];
    [window.rootViewController sol_updateLocalization];
}

- (NSBundle *)bundle {
    if ([self.region length]) {
        NSString *languagePath = [[NSBundle mainBundle]pathForResource:self.region ofType:@"lproj"];
        return [NSBundle bundleWithPath:languagePath];
    } else {
        return [NSBundle mainBundle];
    }
}

- (NSString *)localizedStringForKey:(NSString *)key inTable:(NSString *)table {
    return [[self bundle] localizedStringForKey:key value:@"" table:table ?: @"Localizable"];
}

@end
