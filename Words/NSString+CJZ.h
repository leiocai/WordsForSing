


#import <Foundation/Foundation.h>

@interface NSString (CJZ)


/**
 *  返回分与秒的字符串 如:01:60
 */
+(NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time;

+(NSTimeInterval) getTimeWithString:(NSString *)string;
@end
