//
//  HHRoundCornerImageView.h
//  Swift
//
//  Created by Heym on 2018/11/20.
//  Copyright © 2018 HHYYMM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface HHRoundCornerImageView : UIView
@property (strong, nonatomic) IBInspectable UIImage *image;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat  borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat  cornerRadius;
@property (assign, nonatomic) IBInspectable BOOL borderInside;
@end

IB_DESIGNABLE
@interface HHRoundBoundsImageView : HHRoundCornerImageView

@end

NS_ASSUME_NONNULL_END
