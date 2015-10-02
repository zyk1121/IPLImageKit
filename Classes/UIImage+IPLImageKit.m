//
//  UIImage+IPLImageKit.m
//  Pods
//
//  Created by zhangyuanke on 15/10/2.
//
//

#import "UIImage+IPLImageKit.h"

@implementation UIImage (IPLImageKit)

- (UIImage *)scaleToSize:(CGSize)size
{
    if (size.height == 0 || size.width == 0) {
        return self;
    }
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaleToScale:(CGFloat)scale
{
    if (scale <= 0) {
        return self;
    }
    
    CGSize srcSize = self.size;
    CGSize dstSize;
    dstSize.width = srcSize.width * scale;
    dstSize.height = srcSize.height * scale;
    
    return [self scaleToSize:dstSize];
}

@end
