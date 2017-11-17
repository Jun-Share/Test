//
//  UIView+MushaoTool.h
//  YuanRunCapital
//
//  Created by apple on 16/12/13.
//  Copyright © 2016年 apple-mushao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MushaoTool)

@property (nonatomic, assign) CGFloat ms_centerX;
@property (nonatomic, assign) CGFloat ms_centerY;
@property (nonatomic, assign) CGFloat ms_width;
@property (nonatomic, assign) CGFloat ms_height;
@property (nonatomic, assign) CGSize  ms_size;

@property (nonatomic, assign) CGFloat ms_MaxY;
@property (nonatomic, assign) CGFloat ms_MinY;
@property (nonatomic, assign) CGFloat ms_MaxX;
@property (nonatomic, assign) CGFloat ms_MinX;
@property (nonatomic, assign) CGFloat ms_MidX;
@property (nonatomic, assign) CGFloat ms_MidY;

@property (nonatomic, strong) CAShapeLayer * shapeLayer;
- (void)createShadowWithColor:(UIColor *)shadowColor;
@end
