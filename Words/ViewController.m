
#import "ViewController.h"
#import "Word.h"
#import "AudioPlayTool.h"
#import "NSString+CJZ.h"


@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *wordsArray;
@property (nonatomic,assign) int index;
@property (nonatomic,strong) CADisplayLink *playLink;
@property (nonatomic,strong) AudioPlayTool * playTool;

@property (weak, nonatomic) IBOutlet UIPickerView *wordListPicker;


@end

@implementation ViewController
- (IBAction)nextClick {
    [self.wordListPicker selectRow:self.index inComponent:0 animated:YES];
}


- (AudioPlayTool *)playTool
{
    if (_playTool == nil) {
        _playTool = [[AudioPlayTool alloc]init];
    }
    return _playTool;
}

- (CADisplayLink *)playLink
{
    if (_playLink == nil) {
        _playLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateInfo:)];
    }
    return _playLink;
}

- (NSArray *)wordsArray
{
    if (_wordsArray == nil) {
        _wordsArray = [NSArray array];
    }
    return _wordsArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Set Fire To The Rain_歌词.lrc" ofType:nil];
    self.wordsArray = [[Word alloc] wordsWithFilePath:path];
    [self.playTool prepareAudioWithName:@"31071114.mp3"];
    [self.playTool play];
    [self.playLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
  
}

#pragma mark - UIPickerView DataSource and Delegate;

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  self.wordsArray.count;
    
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    Word *textWord = self.wordsArray[row];
    textLable.text = textWord.text;
    textLable.font = [UIFont systemFontOfSize:13];
    textLable.numberOfLines = 0;
    return textLable;
}
 - (void)updateInfo:(CADisplayLink *)display
{
    AVAudioPlayer *player = self.playTool.audioPlay;
    double currentTime = player.currentTime;
    NSString *change2Time = [NSString getMinuteSecondWithSecond:currentTime];
    double compareTime = [NSString getTimeWithString:change2Time];
    
   for (int i = 0; i < self.wordsArray.count; i++)
    {
        Word *beginW = self.wordsArray[i];
        double wordTime = [NSString getTimeWithString:beginW.time];
        Word *nextW = nil;
        int next = i + 1;
        if (next < self.wordsArray.count) {
            nextW = self.wordsArray[next];
            if (compareTime >= wordTime && compareTime <= [NSString getTimeWithString:nextW.time])
            {
               dispatch_async(dispatch_get_main_queue(), ^{
                self.index = i + 1;
                [self nextClick];
             });
              break;
            }
        }
    }
}



@end
