//
//  UITextField+SOLocalization.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "UITextField+SOLocalization.h"
#import <objc/runtime.h>
#import "SOLocalization.h"

@implementation UITextField (SOLocalization)

- (NSString *)sol_text {
    return objc_getAssociatedObject(self, @selector(sol_text));
}

- (void)setSol_text:(NSString *)sol_text {
    objc_setAssociatedObject(self, @selector(sol_text), [sol_text copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.sol_textAttribute = nil;
    [self sol_updateLocalization];
}

- (NSDictionary *)sol_textAttribute {
    return objc_getAssociatedObject(self, @selector(sol_textAttribute));
}

- (void)setSol_textAttribute:(NSDictionary *)textAttribute {
    objc_setAssociatedObject(self, @selector(sol_textAttribute), [textAttribute copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self sol_updateLocalization];
}

- (NSString *)sol_placeholder {
    return objc_getAssociatedObject(self, @selector(sol_placeholder));
}

- (void)setSol_placeholder:(NSString *)sol_placeholder {
    objc_setAssociatedObject(self, @selector(sol_placeholder), [sol_placeholder copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.sol_placeholderAttribute = nil;
    [self sol_updateLocalization];
}

- (NSDictionary *)sol_placeholderAttribute {
    return objc_getAssociatedObject(self, @selector(sol_placeholderAttribute));
}

- (void)setSol_placeholderAttribute:(NSDictionary *)placeholderAttribute {
    objc_setAssociatedObject(self, @selector(sol_placeholderAttribute), [placeholderAttribute copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setSol_AttributedText:(NSString *)text attribute:(NSDictionary *)attribute {
    self.sol_text = text;
    self.sol_textAttribute = attribute;
}

- (void)setSol_AttributedPlaceholder:(NSString *)placeholder attribute:(NSDictionary *)attribute {
    self.sol_placeholder = placeholder;
    self.sol_placeholderAttribute = attribute;
}

- (void)sol_updateLocalization {
    [super sol_updateLocalization];
    if (self.sol_placeholderAttribute) {
        NSString *placeholder = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_placeholder inTable:self.sol_table];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder attributes:self.sol_placeholderAttribute];
    } else if (self.sol_placeholder) {
        self.placeholder = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_placeholder inTable:self.sol_table];
    }
    if (self.sol_textAttribute) {
        NSString *text = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_text inTable:self.sol_table];
        self.attributedText = [[NSAttributedString alloc]initWithString:text attributes:self.sol_textAttribute];
    } else if (self.sol_text) {
        self.text = [[SOLocalization sharedLocalization]localizedStringForKey:self.sol_text inTable:self.sol_table];
    }
}

@end
