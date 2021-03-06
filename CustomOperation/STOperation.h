//
//  STOperation.h
//  CustomOperation
//
//  Created by yuqian on 2018/9/13.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STOperation : NSOperation

/**NSOperation的线程锁 */
@property (readwrite, nonatomic, strong) NSRecursiveLock *lock;

- (void)finishOperation;

@end
