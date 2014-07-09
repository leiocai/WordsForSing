

#import "Word.h"

@implementation Word

- (instancetype)initWithString:(NSString *)string
{
    if (self = [super init]) {
        NSRange  rangeOne = NSMakeRange(1, 5);
        self.time = [string substringWithRange:rangeOne];
        self.text = [string substringFromIndex:10];
    }
    return self;
}

+ (instancetype)wordWithString:(NSString *)string
{
    return [[self alloc]initWithString:string];
}

- (NSArray *)wordsWithFilePath:(NSString *)path
{
    NSError *error = nil;
    NSString *original = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSArray *stringArray = [original componentsSeparatedByString:@"\n"];
    NSMutableArray *lastArray = [NSMutableArray array];
    for (NSString *string in stringArray) {
        if ((string.length > @"[00:00:00]".length ) && [string hasPrefix:@"[0"]) {
            [lastArray addObject:string];
        }
    }
    NSMutableArray *wordsArray = [NSMutableArray array];
    for (NSString *string in lastArray) {
        Word *singleWord = [Word wordWithString:string];
        [wordsArray addObject:singleWord];
    }
    return [wordsArray copy];
}
@end
