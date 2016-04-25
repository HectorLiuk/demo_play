//
//  UIImage+YJ.m
//  Yuejia
//
//  Created by Karl Zhou on 1/17/15.
//  Copyright (c) 2015 Yuejia. All rights reserved.
//

#import "UIImage+YJ.h"

@implementation UIImage (YJ)
+(UIImage*)createImageByColor:(UIColor*)color size:(CGSize)size{
    UIView* view = [[UIView alloc] init];
    float scale = [UIScreen mainScreen].scale;
    view.frame = CGRectMake(0, 0, size.width, size.height);
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.backgroundColor = color;
    UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //    [imageView drawRect:CGRectMake(0, 0, width, height)];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}
-(UIColor*)colorAtPoint:(CGPoint)point{
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage));
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    int pixelInfo = ((self.size.width  * point.y) + point.x ) * 4; // The image is png
    
    UInt8 red = data[pixelInfo];         // If you need this info, enable it
    UInt8 green = data[(pixelInfo + 1)]; // If you need this info, enable it
    UInt8 blue = data[pixelInfo + 2];    // If you need this info, enable it
    UInt8 alpha = data[pixelInfo + 3];     // I need only this info for my maze game
    CFRelease(pixelData);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
    //UIColor* color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha/255.0f]; // The pixel color info
}

-(UIImage*)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(UIImage*)blurWithRadius:(CGFloat)radius{
    radius =(radius<0)?0:radius;
    radius =(radius>4)?4:radius;
    CIImage * inputImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter * blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:inputImage forKey:@"inputImage"];
    [blurFilter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage * outputImage = [blurFilter outputImage];
    outputImage = [outputImage imageByCroppingToRect:[inputImage extent]];
    UIImage * blurImage = [UIImage imageWithCIImage:outputImage];
    return blurImage;
}

@end
