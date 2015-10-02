//
//  UIImage+IPLImageKit.h
//  Pods
//
//  Created by zhangyuanke on 15/10/2.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (IPLImageKit)
// 图像缩放到指定的size
- (UIImage *)scaleToSize:(CGSize)size;
// 图像缩放到指定的比例scale
- (UIImage *)scaleToScale:(CGFloat)scale;

@end
