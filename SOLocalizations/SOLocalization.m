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

+ (instancetype)sharedLocalization {
    static SOLocalization *localization = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localization = [SOLocalization new];
    });
    return localization;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *region = [[NSUserDefaults standardUserDefaults]objectForKey:SOLocalizationRegionKey];
        if (region) {
            _region = region;
        } else {
            NSArray *languageArray = [[NSUserDefaults standardUserDefaults]objectForKey:SODeviceLocalizationRegionKey];
            if ([languageArray count]) {
                NSString *preferrdLanguage = languageArray[0];
                for (NSString *language in @[SOLocalizationEnglish, SOLocalizationSimplifiedChinese, SOLocalizationTraditionalChinese]) {
                    if ([preferrdLanguage hasPrefix:language]) {
                        _region = language;
                        break;
                    }
                }
            }
        }
    }
    return self;
}

- (void)setRegion:(NSString *)region {
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
    NSLocalizedStringFromTable(<#key#>, <#tbl#>, <#comment#>)
    return [[self bundle] localizedStringForKey:key value:@"" table:table ?: @"infoPlist"];
}

@end
