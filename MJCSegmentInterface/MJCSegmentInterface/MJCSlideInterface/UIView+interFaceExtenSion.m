//
//  UIView+MJCExtension.m

//
//  Created by majiachen on 16/11/6.
//  Copyright © 2016年 majiachen. All rights reserved.
//

#import "UIView+interFaceExtenSion.h"

@implementation UIView (interFaceExtenSion)

- (CGSize)mjc_size
{
    return self.frame.size;
}

- (void)setMjc_size:(CGSize)mjc_size
{
    CGRect frame = self.frame;
    frame.size = mjc_size;
    self.frame = frame;
}

- (CGFloat)mjc_width
{
    return self.frame.size.width;
}

- (CGFloat)mjc_height
{
    return self.frame.size.height;
}

- (void)setMjc_width:(CGFloat)mjc_width
{
    CGRect frame = self.frame;
    frame.size.width = mjc_width;
    self.frame = frame;
}

- (void)setMjc_height:(CGFloat)mjc_height
{
    CGRect frame = self.frame;
    frame.size.height = mjc_height;
    self.frame = frame;
}

- (CGFloat)mjc_x
{
    return self.frame.origin.x;
}

- (void)setMjc_x:(CGFloat)mjc_x
{
    CGRect frame = self.frame;
    frame.origin.x = mjc_x;
    self.frame = frame;
}

- (CGFloat)mjc_y
{
    return self.frame.origin.y;
}

- (void)setMjc_y:(CGFloat)mjc_y
{
    CGRect frame = self.frame;
    frame.origin.y = mjc_y;
    self.frame = frame;
}
- (CGFloat)mjc_centerX
{
    return self.center.x;
}

- (void)setMjc_centerX:(CGFloat)mjc_centerX
{
    CGPoint center = self.center;
    center.x = mjc_centerX;
    self.center = center;
}
- (CGFloat)mjc_centerY
{
    return self.center.y;
}

- (void)setMjc_centerY:(CGFloat)mjc_centerY
{
    CGPoint center = self.center;
    center.y = mjc_centerY;
    self.center = center;
}

- (CGFloat)mjc_right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)mjc_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setMjc_right:(CGFloat)mjc_right
{
    self.mjc_x = mjc_right - self.mjc_width;
}

- (void)setMjc_bottom:(CGFloat)mjc_bottom
{
    self.mjc_y = mjc_bottom - self.mjc_height;
}
@end
