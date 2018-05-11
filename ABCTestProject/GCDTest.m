//
//  GCDTest.m
//  ABCTestProject
//
//  Created by Vicky on 2018/5/4.
//  Copyright © 2018 Vicky. All rights reserved.
//

#import "GCDTest.h"

@implementation GCDTest

/**
 同步执行+异步队列
 
 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务
 */
- (void)syncConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    
    dispatch_queue_t queue = dispatch_queue_create("com.tal.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}


/**
 异步执行+并发队列
 可以开启多个线程，任务交替（同时）执行
 */
- (void)asycConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    
    dispatch_queue_t queue = dispatch_queue_create("com.tal.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}

/**
 同步执行+串行队列
 特点：不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务
 */
- (void)serialSync {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    dispatch_queue_t queue = dispatch_queue_create("com.tal.test", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}


/**
 异步执行+串行队列
 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    dispatch_queue_t queue = dispatch_queue_create("com.tal.test", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}

/**
 同步执行+主线程
 直接调用会导致卡死崩溃
 */
- (void)syncMain {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}

/**
 异步队列+主线程
 */
- (void)asyncMain {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"%d, %s -- Begin", __LINE__, __func__);
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    NSLog(@"%d, %s -- End", __LINE__, __func__);
}

- (void)communication {
    // 获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 获取主队列
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        
        // 异步追加任务
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
        // 回到主线程
        
        dispatch_async(mainQueue, ^{
            
            // 追加在主线程中执行的任务
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            
        });
        
    });
}

- (void)barrier {
    dispatch_queue_t queue = dispatch_queue_create("com.tal.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
    });
    
    
    
    dispatch_barrier_async(queue, ^{
        
        // 追加任务 barrier
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务4
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
    });
    
}

/**
 
 * 延时执行方法 dispatch_after
 
 */

- (void)after {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"asyncMain---begin");
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 2.0秒后异步追加任务代码到主队列，并开始执行
        
        NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程
        
    });
    
}

/**
 
 * 一次性代码（只执行一次）dispatch_once
 
 */

- (void)once {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        // 只执行1次的代码(这里面默认是线程安全的)
        
    });
    
}

/**
 
 * 快速迭代方法 dispatch_apply
 
 */

- (void)apply {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"apply---begin");
    
    dispatch_apply(6, queue, ^(size_t index) {
        
        NSLog(@"%zd---%@",index, [NSThread currentThread]);
        
    });
    
    NSLog(@"apply---end");
}

/**
 
 * 队列组 dispatch_group_notify
 
 */
- (void)groupNotify {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
    });
    
    dispatch_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步任务1、任务2都执行完毕后，回到主线程执行下边任务
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
        NSLog(@"group---end");
    });
}

/**
 队列组 dispatch_group_wait
 */
- (void)groupWait {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
    });
    
    dispatch_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"group---end");
}

/**
 
 * 队列组 dispatch_group_enter、dispatch_group_leave
 
 */
- (void)groupEnterAndLeave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
       // 追加任务1
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@", [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@", [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步操作都执行完毕后，回到主线程.
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
            
        }
        
        NSLog(@"group---end");
    });
//    dispatch_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"group---end");
}

- (void)semaphoreSync {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block int number = 0;
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        number = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"semaphore---end,number = %d",number);
}

/**
 
 * 非线程安全：不使用 semaphore
 
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 
 */
/*
- (void)initTicketStatusNotSave {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    
    
    self.ticketSurplusCount = 50;
    
    
    
    // queue1 代表北京火车票售卖窗口
    
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    
    // queue2 代表上海火车票售卖窗口
    
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(queue1, ^{
        
        [weakSelf saleTicketNotSafe];
        
    });
    
    
    
    dispatch_async(queue2, ^{
        
        [weakSelf saleTicketNotSafe];
        
    });
    
}

*/

/**
 
 * 售卖火车票(非线程安全)
 
 */
/*
- (void)saleTicketNotSafe {
    
    while (1) {
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            
            self.ticketSurplusCount--;
            
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            
            NSLog(@"所有火车票均已售完");
            
            break;
            
        }   
    }
    
}

/**
 
 * 线程安全：使用 semaphore 加锁
 
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 
 */
/*
- (void)initTicketStatusSave {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    
    
    dispatch_semaphore_t semaphoreLock = dispatch_semaphore_create(1);
    
    
    int ticketSurplusCount = 50;

    
    // queue1 代表北京火车票售卖窗口
    
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    
    // queue2 代表上海火车票售卖窗口
    
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(queue1, ^{
        
        [weakSelf saleTicketSafe];
        
    });
    
    
    
    dispatch_async(queue2, ^{
        
        [weakSelf saleTicketSafe];
        
    });
    
}


*/
/**
 
 * 售卖火车票(线程安全)
 
 */
/*
- (void)saleTicketSafe {
    
    while (1) {
        
        // 相当于加锁
        
         dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        
        
        if (self.ticketSurplusCount > 0) {  //如果还有票，继续售卖
            
            self.ticketSurplusCount--;
            
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            
            NSLog(@"所有火车票均已售完");
            
            
            
            // 相当于解锁
            
            dispatch_semaphore_signal(semaphoreLock);
            
            break;
            
        }
        
        
        
        // 相当于解锁
        
        dispatch_semaphore_signal(semaphoreLock);
        
    }
}
*/
@end
