

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class AVAudioPlayer ;
@interface AudioPlayTool : NSObject

@property (nonatomic,strong,readonly ) AVAudioPlayer *audioPlay;

- (void)prepareAudioWithName:(NSString *)name;
- (void)play;
- (void)stop;
- (void)pause;

@end
