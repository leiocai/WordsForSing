

#import <Foundation/Foundation.h>

@interface Word : NSObject
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *text;

+ (instancetype)wordWithString:(NSString *)string;
- (instancetype)initWithString:(NSString *)string;

- (NSArray *)wordsWithFilePath:(NSString *)path;

@end
