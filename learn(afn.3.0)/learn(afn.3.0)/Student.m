//
//  Student.m
//  learn(afn.3.0)
//
//  Created by lk on 16/7/4.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "Student.h"

@implementation Student

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    
    
    return NO;
}

- (void)setCount:(int)count{
    [self willChangeValueForKey:@"count"];
    _count = count;
    [self didChangeValueForKey:@"count"];
    
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(__unused id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    

    
}
@end
