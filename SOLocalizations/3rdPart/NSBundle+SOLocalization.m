//
//  NSBundle+SOLocalization.m
//  Meeting
//
//  Created by mac-xtzx on 2019/5/30.
//  Copyright © 2019 iPEBG. All rights reserved.
//

#import "NSBundle+SOLocalization.h"
#import "SOLocalization.h"
#import "SOSwizzle.h"

@interface NSBundle (MJRefresh)

+ (instancetype)mj_refreshBundle;
+ (NSString *)mj_localizedStringForKey:(NSString *)key value:(NSString *)value;

@end

@implementation NSBundle (SOLocalization)

+ (void)load {
    SOSwizzleClassMethod([NSBundle class], @selector(mj_localizedStringForKey:value:), @selector(sol_localizedStringForKey:value:));
}
    
+ (NSString *)sol_localizedStringForKey:(NSString *)key value:(NSString *)value
{
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        // 从MJRefresh.bundle中查找资源
        bundle = [NSBundle bundleWithPath:[[NSBundle mj_refreshBundle] pathForResource:[SOLocalization sharedLocalization].region ofType:@"lproj"]];
    }
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

@end
