#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import "UIImage+IPLImageKit.h"

#define IPL_SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define IPL_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kIPLIOSVersion [UIDevice currentDevice].systemVersion.doubleValue

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) UIImage *srcImage;
@property (nonatomic, strong) UIImageView *srcImageView;
@property (nonatomic, strong) UIImageView *dstImageView;
@property (nonatomic, strong) NSMutableArray *buttonArrays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *buttonTitles = @[@"图像缩放", @"图像旋转"];
    _buttonArrays = [[NSMutableArray alloc] init];
    
    _contentView = [[UIScrollView alloc] init];
    CGSize contentSize = CGSizeMake(IPL_SCREEN_WIDTH, 800);
    _contentView.contentSize = contentSize;
    [self.view addSubview:_contentView];
    
    _srcImage = ({
        UIImage *image = [UIImage imageNamed:@"lena.jpg"];
        image;
    });
    
    _srcImageView = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor lightGrayColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = _srcImage;
        [self.contentView addSubview:imageView];
        imageView;
    });
    
    [buttonTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *title = (NSString *)obj;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(imageProcessFunction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        [_buttonArrays addObject:button];
    }];
    
    _dstImageView = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:imageView];
        imageView;
    });
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    __block UIView *lastView = nil;
    __block CGFloat offset = 0;
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
    
    if (self.srcImageView) {
        [self.srcImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(50);
            make.width.equalTo(@200);
            make.height.equalTo(@200);
            make.centerX.equalTo(self.contentView);
        }];
        lastView = self.srcImageView;
        offset = 30;
    }
    
    if ([self.buttonArrays count]) {
        [self.buttonArrays enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIButton *button = (UIButton *)obj;
            [button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastView.mas_bottom).offset(offset);
                offset = 0;
                make.centerX.equalTo(self.view);
            }];
            lastView = button;
        }];
        offset = 30;
    }
    
    [self.dstImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lastView.mas_bottom).offset(offset);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
        make.centerX.equalTo(self.contentView);
    }];
}

- (void)imageProcessFunction:(UIButton *)button
{
    // 图像缩放
    if ([button.titleLabel.text isEqualToString:@"图像缩放"]) {
//        CGSize size = CGSizeMake(200, 100);
//        UIImage *dstImage = [self.srcImage scaleToSize:size];
//        self.dstImageView.image = dstImage;
        UIImage *dstImage = [self.srcImage scaleToScale:0.3];
        self.dstImageView.image = dstImage;

    }
    
    // 图像旋转
    if ([button.titleLabel.text isEqualToString:@"图像旋转"]) {
        
    }
    
}

@end
