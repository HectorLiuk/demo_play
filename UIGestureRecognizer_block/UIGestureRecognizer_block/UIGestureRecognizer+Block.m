//
//  UIGestureRecognizer+Block.m
//  UIGestureRecognizer_block
//
//  Created by lk on 16/4/8.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>
static const int target_key;

@implementation UIGestureRecognizer (Block)

+(instancetype)nvm_gestureRecognizerWithActionBlock:(ActionBlock)block {
    return [[self alloc]initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(ActionBlock)block {
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

- (void)addActionBlock:(ActionBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender {
    ActionBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}



@end
