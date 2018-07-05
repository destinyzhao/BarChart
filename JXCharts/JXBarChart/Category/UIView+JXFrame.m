//
//  UIView+JXFrame.m
//  JXCharts
//
//  Created by Destiny on 2018/6/15.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "UIView+JXFrame.h"

@implementation UIView (JXFrame)

- (void)setX:(CGFloat)x
{
    CGRect tempF = self.frame;
    tempF.origin.x = x;
    self.frame = tempF;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect tempF = self.frame;
    tempF.origin.y = y ;
    self.frame = tempF;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect tempF = self.frame;
    tempF.size.width = width;
    self.frame = tempF;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint tempF = self.center;
    tempF.x = centerX;
    self.center = tempF;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint tempF = self.center;
    tempF.y = centerY;
    self.center = tempF;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect tempF = self.frame;
    tempF.size.height = height;
    self.frame = tempF;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect tempF = self.frame;
    tempF.size = size;
    self.frame = tempF;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)left;
{
    return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x;
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)top;
{
    return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y;
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)right;
{
    return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = [self frame];
    frame.origin.x = right - frame.size.width;
    
    [self setFrame:frame];
}

- (CGFloat)bottom;
{
    return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom;
{
    CGRect frame = [self frame];
    frame.origin.y = bottom - frame.size.height;
    
    [self setFrame:frame];
}

@end
