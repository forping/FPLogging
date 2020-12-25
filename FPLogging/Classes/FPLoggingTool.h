//
//  FPLogging.h
//  FPLogging_Example
//
//  Created by 金医桥 on 2020/12/25.
//  Copyright © 2020 aiyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPLoggingTool : NSObject


/// 单例实例, 通过alloc init 创建的不是单例实例
+ (instancetype) sharedInstance;


/// 记录日志
/// @param info 日志信息,
- (void)logInfo:(NSString*)info;


/// 清空过期的日志
- (void)clearExpiredLog;

@property (nonatomic , readonly) NSString *filePath;

@end

NS_ASSUME_NONNULL_END
