

#import "NSString+CJZ.h"

@implementation NSString (CJZ)

+(NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time{
    
    int minute = (int)time / 60;
    int second = (int)time % 60;
    
    if (second > 9) {
        return [NSString stringWithFormat:@"%d:%d",minute,second];
    }
    return [NSString stringWithFormat:@"%d:0%d",minute,second];
}

+ (NSTimeInterval)getTimeWithString:(NSString *)string{
    if (string.length == 5) {
        double first = [[string substringWithRange:NSMakeRange(1, 1)] doubleValue];
        double second = [[string substringFromIndex:3] doubleValue];
        return first + second * 0.01;
    }
    double first = [[string substringWithRange:NSMakeRange(0, 1)] doubleValue];
    double second = [[string substringFromIndex:2] doubleValue];
    return first + second * 0.01;
}

@end
