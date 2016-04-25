//
//  UIImage+YJ.h
//  Yuejia
//
//  Created by Karl Zhou on 1/17/15.
//  Copyright (c) 2015 Yuejia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJ)
+(UIImage*)createImageByColor:(UIColor*)color size:(CGSize)size;
-(UIColor*)colorAtPoint:(CGPoint)point;
-(UIImage*)scaleToSize:(CGSize)size;

-(UIImage*)blurWithRadius:(CGFloat)radius;
//-(UIImage*)screenShot;
@end
