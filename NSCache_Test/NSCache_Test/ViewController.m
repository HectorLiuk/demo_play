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
    
    
    for (int i = 0; i < 50; i++) {
        NSData *data = [NSData dataWithContentsOfURL:imageUrl];
        [self.cache setObject:data forKey:@(i)];
        NSLog(@"存入cahe 次=%@  size= %@",@(i),@(data.length));
    }
   
    for (int w = 0; w<10; w++) {
//        NSLog(@"缓存中=== %@",[self.cache objectForKey:@(w)]);
    }
  
}
- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
     NSLog(@"被删除的对象是:%@",obj);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
