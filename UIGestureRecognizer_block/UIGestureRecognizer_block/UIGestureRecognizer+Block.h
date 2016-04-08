//
//  UIGestureRecognizer+Block.h
//  UIGestureRecognizer_block
//
//  Created by lk on 16/4/8.
//  Copyright © 2016年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)();

@interface UIGestureRecognizer (Block)

+(instancetype)nvm_gestureRecognizerWithActionBlock:(ActionBlock)block;
@end
