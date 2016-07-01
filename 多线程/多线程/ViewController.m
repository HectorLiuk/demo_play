//
//  ViewController.m
//  多线程
//
//  Created by pht on 16/1/29.
//  Copyright © 2016年 LK. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()
@property (readonly, getter=isExecuting) BOOL executing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //    [self GCD];
    //    [self group];
    
    //3.2.主队列执行8次循环
    [NSThread sleepForTimeInterval:2.0f];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; i < 8; i++) {
            NSLog(@"group-02 - %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2222xxxx");
    });
    NSLog(@"xxxxxx");
    
}

- (void)GCD{
    
    
    //    名称                	                    Dispatch Queue种类	     说明
    //    Main Dispatch Queue	                   Serial Dispatch Queue	主线程执行
    //    DISPATCH_QUEUE_PRIORITY_HIGH	            Concurrent Dispatch Queue	高优先级
    //    DISPATCH_QUEUE_PRIORITY_DEFAULT	       Concurrent Dispatch Queue	默认优先级(全局并行队列)
    //    DISPATCH_QUEUE_PRIORITY_LOW	            Concurrent Dispatch Queue	低优先级
    //    DISPATCH_QUEUE_PRIORITY_BACKGROUND	  Concurrent Dispatch Queue	后台执行
    //    DISPATCH_QUEUE_SERIAL                                            串行队列
    //    DISPATCH_QUEUE_CONCURRENT                                        并行队列
    
    
    
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.testQueue", NULL);
    dispatch_queue_t queue1 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_SERIAL);
    
    
    //并行队列
    dispatch_queue_t queue2 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    
    //OBJECTIVE-C
    //全局并行队列
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    //同步任务
    dispatch_sync(queue, ^{
        //code here
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"%@", [NSThread currentThread]);
        
    });
    
    
}


/**
 *  eg  卡死主线程
 */
- (void)main_queue{
    NSLog(@"之前 - %@", [NSThread currentThread]);
    
    //dispatch_get_main_queue()
    
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        //code here
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"之后 - %@", [NSThread currentThread]);
}

- (void)group{
    //    队列组
    //    队列组可以将很多队列添加到一个组里，这样做的好处是，当这个组里所有的任务都执行完了，队列组会通过一个方法通知我们。下面是使用方法，这是一个很实用的功能。
    
    //1.创建队列组
    dispatch_group_t group = dispatch_group_create();
    //2.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //3.多次使用队列组的方法执行任务, 只有异步方法
    //3.1.执行3次循环
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"group-01 - %@", [NSThread currentThread]);
        }
    });
    
    //3.2.主队列执行8次循环
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; i < 8; i++) {
            NSLog(@"group-02 - %@", [NSThread currentThread]);
        }
    });
    
    //3.3.执行5次循环
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            NSLog(@"group-03 - %@", [NSThread currentThread]);
        }
    });
    
    //4.都完成后会自动通知
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"完成 - %@", [NSThread currentThread]);
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"");
    });
    
    
    
    
    
    
    
    
    
}














/**
 *  pthread线程创建方式
 */
- (void)pthread{
    pthread_t thread;
    //创建一个线程并自动执行
    pthread_create(&thread, NULL, start, NULL);
}



void *start(void *data) {
    NSLog(@"%@", [NSThread currentThread]);
    
    return NULL;
}
@end
