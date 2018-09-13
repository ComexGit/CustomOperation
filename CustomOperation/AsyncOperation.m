//
//  AsyncOperation.m
//  CustomOperation
//
//  Created by yuqian on 2018/9/13.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import "AsyncOperation.h"

@implementation AsyncOperation{
    BOOL executing;
    BOOL finished;
}

- (id)init {
    if(self = [super init])
    {
        executing = NO;
        finished = NO;
    }
    return self;
}

- (BOOL)isConcurrent {
    
    return YES;
}

- (BOOL)isExecuting {
    
    return executing;
}

- (BOOL)isFinished {
    
    return finished;
}

- (void)start {
    
    //第一步就要检测是否被取消了，如果取消了，要实现相应的KVO
    if ([self isCancelled]) {
        
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    //如果没被取消，开始执行任务
    [self willChangeValueForKey:@"isExecuting"];
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main {
    @try {
        
        @autoreleasepool {
            //在这里定义自己的并发任务
            NSLog(@"自定义并发操作NSOperation");
            NSThread *thread = [NSThread currentThread];
            NSLog(@"%@",thread);
            
            //任务执行完成后要实现相应的KVO
            [self willChangeValueForKey:@"isFinished"];
            [self willChangeValueForKey:@"isExecuting"];
            
            executing = NO;
            finished = YES;
            
            [self didChangeValueForKey:@"isExecuting"];
            [self didChangeValueForKey:@"isFinished"];
        }
    }
    @catch (NSException *exception) {
        
    }
}

@end
