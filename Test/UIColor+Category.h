//
//  UIColor+Category.h
//  ZMClient
//
//  Created by stevenlfg on 15/11/27.
//  Copyright © 2015年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)
+ (UIColor *) colorWithHex:(long)hexColor;
+ (UIColor *) colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *) colorWithHexString:(NSString *)color;
@end
