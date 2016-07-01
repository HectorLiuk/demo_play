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
//    [NSThread currentThread]
//     NSLog(@"%@",[NSThread currentThread]);打印的意思
//    {number = 1, name = main} number代表线程  name:代表线程名字

    
//    [self group];
   
    [self operationQueue];
    
    
    
    
}
/**
 *  同步和异步的区别
 */
- (void)asyncAndSync{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2%@",[NSThread currentThread]);
    });
    
    //
    dispatch_queue_t queue1 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue1, ^{
        NSLog(@"3.1%@",[NSThread currentThread]);
    });
    //为什么子线程同步直接回到主线程
    //因为同步是在当前的线程完成操作，而当前的线程是主线程
    dispatch_sync(queue1, ^{
        NSLog(@"子线程同步4 %@",[NSThread currentThread]);
        
    });
    dispatch_queue_t queue2 = dispatch_queue_create("ssss", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue2, ^{
        NSLog(@"5 %@",[NSThread currentThread]);
        dispatch_sync(queue1, ^{
            //子线程同步，当前的线程是子线程。所以它打印的是5的线程  5=6
            NSLog(@"子线程同步6 %@",[NSThread currentThread]);
            
        });
    });
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
    
   
    NSLog(@"xxxxxx");
    
}

- (void)GCD{

    //    DISPATCH_QUEUE_SERIAL                                            串行队列
    //    DISPATCH_QUEUE_CONCURRENT                                        并行队列
    
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.testQueue", NULL);
    dispatch_queue_t queue1 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_SERIAL);
    
    //并行队列
    dispatch_queue_t queue2 = dispatch_queue_create("tk.bourne.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
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

/**
 *  队列组
 */
- (void)group{
    //    队列组
    //    队列组可以将很多队列添加到一个组里，这样做的好处是，当这个组里所有的任务都执行完了，队列组会通过一个方法通知我们。下面是使用方法，这是一个很实用的功能。
    
    //1.创建队列组
    dispatch_group_t group = dispatch_group_create();
    //2.创建队列
    //    DISPATCH_QUEUE_PRIORITY_HIGH	            Concurrent Dispatch Queue	高优先级
    //    DISPATCH_QUEUE_PRIORITY_DEFAULT	       Concurrent Dispatch Queue	默认优先级(全局并行队列)
    //    DISPATCH_QUEUE_PRIORITY_LOW	            Concurrent Dispatch Queue	低优先级
    //    DISPATCH_QUEUE_PRIORITY_BACKGROUND	  Concurrent Dispatch Queue	后台执行
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
 *  NSOperation和NSOperationQueue
 */
- (void)operationQueue{
    //获得主队列
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    
    
    
    //创建其他队列
    NSOperationQueue *elseQueue = [[NSOperationQueue alloc] init];
    
    //创建一个任务
    NSBlockOperation *oneOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"第一个任务%@",[NSThread currentThread]);
    }];
    //添加多个任务
    for (NSInteger i = 0; i < 5; i++) {
        [oneOperation addExecutionBlock:^{
            NSLog(@"第%ld次：%@", i, [NSThread currentThread]);
        }];
    }
    
//    elseQueue.maxConcurrentOperationCount = 1; //代表串行
    
    //执行的任务全部都在子线程完成
    [elseQueue addOperation:oneOperation];
    
    //新加入任务
    [elseQueue addOperationWithBlock:^{
        NSLog(@"新添加的任务%@",[NSThread currentThread]);
    }];
         
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
