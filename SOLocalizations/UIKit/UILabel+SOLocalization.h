//
//  UILabel+SOLocalization.h
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SOLocalization.h"

@interface UILabel (SOLocalization)

@property (copy, nonatomic) NSString *sol_text;
/// 文本属性
@property (copy, nonatomic) NSDictionary *sol_textAttribute;
    
/// 设置属性文本
- (void)setSol_AttributedText:(NSString *)text attribute:(NSDictionary *)attribute;
    
@end
