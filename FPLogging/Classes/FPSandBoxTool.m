//
//  FPSandBoxTool.m
//  FPLogging_Example
//
//  Created by 金医桥 on 2020/12/25.
//  Copyright © 2020 aiyanbo. All rights reserved.
//

#import "FPSandBoxTool.h"

@implementation FPSandBoxTool

+ (BOOL)clearExpiredLogogingFileWithDay:(NSInteger)expiredDay{
    
    NSString *cacheFilePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    
    NSString *dirPath = [cacheFilePath stringByAppendingPathComponent:@"com.forping.logging"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath] == NO) {
        return YES;
    }
    
    NSArray<NSString *> * files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:NULL];
    
    
    // 创建日期格式化
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    // 设置时区，解决8小时
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSTimeInterval currTimeInterval = [[self getCurrDate] timeIntervalSince1970];

    
    for (NSString* file in files) {
        NSDate* date = [dateFormatter dateFromString:file];
        
        if (date) {
            NSTimeInterval oldTime = [date timeIntervalSince1970];
                      
           NSTimeInterval second = currTimeInterval - oldTime;
           int day = (int)second / (24 * 3600);
           if (day >= expiredDay) {
               // 删除该文件
               [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/%@",dirPath,file] error:nil];
           }
        }
    }
    return YES;
}


+ (NSString *)getLocalLoggingFilePath{
    
    NSString *cacheFilePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    
    NSString *dirPath = [cacheFilePath stringByAppendingPathComponent:@"com.forping.logging"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath] == NO) {
        BOOL createDirResult = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:NULL];
        
        NSAssert(createDirResult == YES, @"");
        if (createDirResult == NO) {
            
            return nil;
        }
    }
    
    // 创建日期格式化
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    // 设置时区，解决8小时
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

    NSString *timeString = [dateFormatter stringFromDate:[self getCurrDate]];
    
    NSString *filePath = [dirPath stringByAppendingPathComponent:timeString];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO) {
        BOOL createFileResult = [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
        
        NSAssert(createFileResult == YES, @"");
        if (createFileResult == NO) {
            return nil;
        }
    }
    
    return filePath;
}


// 获取当前时间
+ (NSDate*)getCurrDate{
    
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    return localeDate;
}





@end
