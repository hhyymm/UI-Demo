//
//  HHRoundCornerImageView.m
//  Swift
//
//  Created by Heym on 2018/11/20.
//  Copyright © 2018 HHYYMM. All rights reserved.
//

#import "HHRoundCornerImageView.h"

@implementation HHRoundCornerImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    //    self.opaque = YES;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}


- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (void)setBorderInside:(BOOL)borderInside {
    _borderInside = borderInside;
    [self setNeedsDisplay];
}

#pragma mark - draw

- (void)drawRect:(CGRect)rect {

    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextClearRect(contex,rect);
    //    CGContextSaveGState(contex);
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    
    
    CGRect imageRect = rect;
    if (self.borderInside) {
        
    } else {
        imageRect = (CGRect) {
            CGPointMake(self.borderWidth , self.borderWidth ),
            CGSizeMake(CGRectGetWidth(rect) - 2*self.borderWidth,
                       CGRectGetHeight(rect) - 2*self.borderWidth)
        };
    }
  
    
    
    CGContextScaleCTM(contex, 1, -1);
    CGContextTranslateCTM(contex, 0, -rect.size.height);
    CGContextDrawImage(contex, imageRect, self.image.CGImage);
  
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    UIBezierPath *path2 = [path bezierPathByReversingPath];

    CGContextSetFillColorWithColor(contex, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0000].CGColor);

    [path2 appendPath:[UIBezierPath bezierPathWithRect:rect]];
    [path2 fillWithBlendMode:kCGBlendModeCopy alpha:1];

    CGContextSaveGState(contex);
    
    // 内圈
    CGRect innerRect = (CGRect){
        CGPointMake(self.borderWidth, self.borderWidth),
        CGSizeMake(width - 2*self.borderWidth, height - 2*self.borderWidth)
    };
    UIBezierPath *inPath = [UIBezierPath bezierPathWithRoundedRect:innerRect
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:CGSizeMake(self.cornerRadius - self.borderWidth,
                                                                              self.cornerRadius - self.borderWidth)];
    inPath = [inPath bezierPathByReversingPath];
    
    //外圈
    UIBezierPath *outPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                  byRoundingCorners:UIRectCornerAllCorners
                                                        cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    [outPath appendPath:inPath];
    
    CGContextAddPath(contex, outPath.CGPath);
    CGContextSetFillColorWithColor(contex, self.borderColor.CGColor);
    [outPath fill];
}

@end


@implementation HHRoundBoundsImageView

- (void)drawRect:(CGRect)rect {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextClearRect(contex,rect);
        //    CGContextSaveGState(contex);

    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    
    CGRect imageRect = rect;

    if (self.borderInside) {
        
    } else {
        imageRect = (CGRect) {
            CGPointMake(self.borderWidth , self.borderWidth ),
            CGSizeMake(CGRectGetWidth(rect) - 2*self.borderWidth,
                       CGRectGetHeight(rect) - 2*self.borderWidth)
        };
    }
    
    CGContextScaleCTM(contex, 1, -1);
    CGContextTranslateCTM(contex, 0, -rect.size.height);
    CGContextDrawImage(contex, imageRect, self.image.CGImage);

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(width, height)];
    UIBezierPath *path2 = [path bezierPathByReversingPath];

    CGContextSetFillColorWithColor(contex, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0000].CGColor);

    [path2 appendPath:[UIBezierPath bezierPathWithRect:rect]];
    [path2 fillWithBlendMode:kCGBlendModeCopy alpha:1];

    CGContextSaveGState(contex);
    // 内圈
    CGRect innerRect = (CGRect){
        CGPointMake(self.borderWidth, self.borderWidth),
        CGSizeMake(width - 2*self.borderWidth, height - 2*self.borderWidth)
    };
    UIBezierPath *inPath = [UIBezierPath bezierPathWithRoundedRect:innerRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(width/2.0 - self.borderWidth, height/2.0 - self.borderWidth)];
    inPath = [inPath bezierPathByReversingPath];
    
    //外圈
    UIBezierPath *outPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(width/2.0, height/2.0)];
    [outPath appendPath:inPath];

    CGContextAddPath(contex, outPath.CGPath);
    CGContextSetFillColorWithColor(contex, self.borderColor.CGColor);
    [outPath fill];
}


@end
