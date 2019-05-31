//
//  UITextField+SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SOLocalization.h"

@interface UITextField (SOLocalization)

/// 文本
@property (copy, nonatomic) NSString *sol_text;
/// 文本属性
@property (copy, nonatomic) NSDictionary *sol_textAttribute;
/// 提示内容
@property (copy, nonatomic) NSString *sol_placeholder;
/// 提示内容属性
@property (copy, nonatomic) NSDictionary *sol_placeholderAttribute;

/// 设置属性文本
- (void)setSol_AttributedText:(NSString *)text attribute:(NSDictionary *)attribute;
/// 设置属性提示内容
- (void)setSol_AttributedPlaceholder:(NSString *)placeholder attribute:(NSDictionary *)attribute;

@end
