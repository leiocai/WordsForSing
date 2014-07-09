

#import "AudioPlayTool.h"


@interface AudioPlayTool()


@end

@implementation AudioPlayTool


- (void)prepareAudioWithName:(NSString *)name
{
   NSError *error = nil;
    NSString *songPath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
     AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:songPath] error:&error];
    if (error) {
              return;
    }
    [player prepareToPlay];
    _audioPlay = player;
}

- (void)play
{
    if (![_audioPlay isPlaying]) {
        [self.audioPlay play];
    
    }
}

- (void)stop
{
    [self.audioPlay stop];
}

- (void)pause
{
    if ([_audioPlay isPlaying]) {
        [self.audioPlay pause];
    
    }
}

@end
