//
//  UILabel+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UILabel+SOLocalization.h"
#import <objc/runtime.h>
#import "SOLocalization.h"

@implementation UILabel (SOLocalization)

- (void)setSol_text:(NSString *)sol_text {
    objc_setAssociatedObject(self, @selector(sol_text), [sol_text copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.sol_textAttribute = nil;
    [self sol_updateLocalization];
}

- (NSString *)sol_text {
    return objc_getAssociatedObject(self, @selector(sol_text));
}
    
- (NSDictionary *)sol_textAttribute {
    return objc_getAssociatedObject(self, @selector(sol_textAttribute));
}
    
- (void)setSol_textAttribute:(NSDictionary *)textAttribute {
    objc_setAssociatedObject(self, @selector(sol_textAttribute), [textAttribute copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}
    
- (void)setSol_AttributedText:(NSString *)text attribute:(NSDictionary *)attribute {
    self.sol_text = text;
    self.sol_textAttribute = attribute;
}

- (void)sol_updateLocalization {
    if (self.sol_textAttribute) {
        NSString *text = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_text inTable:self.sol_table];
        self.attributedText = [[NSAttributedString alloc]initWithString:text attributes:self.sol_textAttribute];
    } else if (self.sol_text) {
        self.text = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_text inTable:self.sol_table];
    }
}

@end
