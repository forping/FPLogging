

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPSandBoxTool : NSObject

+ (NSString *)getLocalLoggingFilePath;

+ (BOOL)clearExpiredLogogingFileWithDay:(NSInteger)expiredDay;
@end

NS_ASSUME_NONNULL_END
