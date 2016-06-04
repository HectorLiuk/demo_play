//
//  ViewController.m
//  NSCache_Test
//
//  Created by lk on 16/5/30.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSCacheDelegate>
@property (nonatomic, strong) NSCache *cache;
@end

@implementation ViewController
- (NSCache *)cache{
    if (!_cache) {
        _cache = [[NSCache alloc] init];
        _cache.delegate = self;
    }
    return _cache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"chaheAddress= %@",[NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
    
    NSURL *imageUrl = [[NSBundle mainBundle] URLForResource:@"222" withExtension:@"png"];
    
    
    for (int i = 0; i < 10; i++) {
        NSData *data = [NSData dataWithContentsOfURL:imageUrl];
        [self.cache setObject:data forKey:@(i)];
        NSLog(@"存入cahe 次=%@  size= %@",@(i),@(data.length));
    }
   
    for (int w = 0; w<10; w++) {
//        NSLog(@"缓存中=== %@",[self.cache objectForKey:@(w)]);
    }
    
    
    NSString* parameter = @"xxxx";
    NSLog(@"1 = %@",[NSThread currentThread]);

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString* result = [parameter stringByAppendingString:@"__"];
        NSLog(@"2 = %@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"xxxxxxx%@",result);
            NSLog(@"3 = %@",[NSThread currentThread]);

        });
    });
  
}
- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
     NSLog(@"被删除的对象是:%@",obj);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
