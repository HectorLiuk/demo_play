//
//  blockTheory.m
//  block写法
//
//  Created by Hector on 2016/12/9.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "blockTheory.h"

@implementation blockTheory
- (void)blockTheory{
    [self.dic setObject:@"234" forKey:@"123"];
    NSLog(@"dic %p",self.dic);
    
    __block NSMutableDictionary *dicBlock = [[NSMutableDictionary alloc] init];
    [dicBlock setObject:@"123" forKey:@"123"];
    NSLog(@"dicBlock %p",dicBlock);

    
    void (^block)() = ^{
        [self.dic setObject:@"234" forKey:@"234"];

        NSLog(@"dic %p",self.dic);
        
        [dicBlock setObject:@"123" forKey:@"345"];
        NSLog(@"dicBlock %p",dicBlock);

    };
    
    block();
    
    
    //block块里的指针地址相同
    
}
- (NSMutableDictionary *)dic{
    if (!_dic) {
        _dic = [[NSMutableDictionary alloc] init];
    }
    return _dic;
}

@end
