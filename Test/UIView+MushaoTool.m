//
//  UIView+MushaoTool.m
//  YuanRunCapital
//
//  Created by apple on 16/12/13.
//  Copyright © 2016年 apple-mushao. All rights reserved.
//

#import "UIView+MushaoTool.h"

@implementation UIView (MushaoTool)
@dynamic ms_MaxX,ms_MinX,ms_size,ms_width,ms_height,ms_MaxY,ms_MinY,ms_centerX,ms_centerY,ms_MidX,ms_MidY;
static NSString const * shapeLayerKey = @"shapeLayerKey";
- (void)setShapeLayer:(CAShapeLayer *)shapeLayer {
    if (shapeLayer != self.shapeLayer) {
        objc_setAssociatedObject(self, &shapeLayerKey,
                                 shapeLayer, OBJC_ASSOCIATION_ASSIGN);
    }
}
- (CAShapeLayer *)shapeLayer {
    return objc_getAssociatedObject(self, &shapeLayerKey);
}
#pragma mark-----------center
-(CGFloat)ms_centerY
{
    return self.center.y;
}
-(void)setMs_centerY:(CGFloat)ms_centerY
{
    CGPoint center = self.center;
    center.y = ms_centerY;
    self.center = center;
}
-(CGFloat)ms_centerX
{
    return self.center.x;
}
-(void)setMs_centerX:(CGFloat)ms_centerX
{
    CGPoint center = self.center;
    center.x = ms_centerX;
    self.center = center;
}
#pragma mark-----------最小y
-(CGFloat)ms_MinY
{
    return CGRectGetMinY(self.frame);
}
-(void)setMs_MinY:(CGFloat)ms_MinY
{
    CGRect rect = self.frame;
    rect.origin.y = ms_MinY;
    self.frame = rect;
}
#pragma mark-----------最大y
-(CGFloat)ms_MaxY
{
    return CGRectGetMaxY(self.frame);
}
-(void)setMs_MaxY:(CGFloat)ms_MaxY
{
    CGRect rect = self.frame;
    rect.origin.y = ms_MaxY-self.frame.size.height;
    self.frame = rect;
}
#pragma mark-----------最小x
-(CGFloat)ms_MinX
{
    return CGRectGetMinX(self.frame);
}
-(void)setMs_MinX:(CGFloat)ms_MinX
{
    CGRect rect = self.frame;
    rect.origin.x = ms_MinX;
    self.frame = rect;
}
#pragma mark-----------最大x
-(CGFloat)ms_MaxX
{
    return CGRectGetMaxX(self.frame);
}
-(void)setMs_MaxX:(CGFloat)ms_MaxX
{
    CGRect rect = self.frame;
    rect.origin.x = ms_MaxX-self.frame.size.width;
    self.frame = rect;
}
#pragma mark-----------

-(CGFloat)ms_width
{
    return CGRectGetWidth(self.frame);
}
-(void)setMs_width:(CGFloat)ms_width
{
    CGRect rect = self.frame;
    rect.size.width = ms_width;
    self.frame = rect;
}
#pragma mark-----------

-(CGFloat)ms_height
{
    return CGRectGetHeight(self.frame);
}
-(void)setMs_height:(CGFloat)ms_height
{
    CGRect rect = self.frame;
    rect.size.height = ms_height;
    self.frame = rect;
}
#pragma mark-----------

-(CGFloat)ms_MidY
{
    return CGRectGetMidY(self.frame);
}
-(void)setMs_MidY:(CGFloat)ms_MidY
{
    CGRect rect = self.frame;
    rect.origin.y = ms_MidY-self.frame.size.height/2.0;
    self.frame = rect;
}
#pragma mark-----------

-(CGFloat)ms_MidX
{
    return CGRectGetMidX(self.frame);
}
-(void)setMs_MidX:(CGFloat)ms_MidX
{
    CGRect rect = self.frame;
    rect.origin.x = ms_MidX-self.frame.size.width/2.0;
    self.frame = rect;
}
#pragma mark-----------

-(CGSize)ms_size
{
    return self.frame.size;
}
-(void)setMs_size:(CGSize)ms_size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ms_size.width, ms_size.height);
}

- (void)createShadowWithColor:(UIColor *)shadowColor {
    if (self.shapeLayer) {
        self.shapeLayer.shadowColor = shadowColor.CGColor;
        self.shapeLayer.backgroundColor = shadowColor.CGColor;
        return;
    }
    if (self.superview) {
        CAShapeLayer * shapeLayer = [CAShapeLayer layer];
        shapeLayer.shadowOpacity = 0.8;
        shapeLayer.shadowRadius = 3;
        shapeLayer.shadowOffset = CGSizeMake(0, 3);
        shapeLayer.shadowColor = shadowColor.CGColor;
        shapeLayer.frame = self.bounds;
        shapeLayer.cornerRadius = self.layer.cornerRadius;
        shapeLayer.backgroundColor = shadowColor.CGColor;
        [self.superview.layer insertSublayer:shapeLayer atIndex:0];
        self.shapeLayer = shapeLayer;
    }
    
    
}

@end
