//
//  CBHeaderChooseViewScrollView.m
//  JZLConstructApp
//
//  Created by Apple on 17/4/5.
//  Copyright © 2017年 com.jzl. All rights reserved.
//

#import "AddTopScrollView.h"
#import "CBNoHightlightedBtn.h"

@interface AddTopScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIButton* selectedBtn;

@property (nonatomic, strong) UIView* sliderView;

@property (nonatomic, strong) NSMutableArray *btnArray;

@end

#define CBColorA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//②屏幕尺寸
#define CBScreenH [UIScreen mainScreen].bounds.size.height
#define CBScreenW [UIScreen mainScreen].bounds.size.width

@implementation AddTopScrollView

{
    UIColor *titleColor;
    UIColor *titleSelectedColor;
    CGFloat titleFontSize;
    NSArray *titleArray;
    CGFloat headerH;
}

#pragma mark - 懒加载

- (NSMutableArray *)btnArray{
    if (!_btnArray) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}

#pragma mark - UI

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator=NO;
        self.delegate=self;
        self.layer.borderColor=CBColorA(204, 204, 204, 1).CGColor;
        self.layer.borderWidth=0.5;
//        self.auto
        headerH=self.frame.size.height;
    }
    return self;
}

//移除通知
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)setUpTitleArray :(NSArray <NSString *> *)array titleColor :(UIColor *)color titleSelectedColor:(UIColor *)selectedColor titleFontSize :(CGFloat)size{
    titleColor=color;
    if (color==nil) {
        titleColor=[UIColor colorWithHexString:@"666666"];
    }
    
    titleSelectedColor=selectedColor;
    if (selectedColor==nil) {
        titleSelectedColor=[UIColor colorWithHexString:@"E82434"];
    }
    
    titleFontSize=size;
    if (size==0) {
        titleFontSize=13;
    }
    
    titleArray=array;
    if (array.count!=0) {
        [self setUpUI];
    }
}

//UI
- (void)setUpUI{
    
    if (titleArray.count==0) {
        return;
    }
    
    [self.btnArray removeAllObjects];
    for (NSInteger i=0; i<titleArray.count; i++) {
        UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [self.btnArray addObject:btn];
        btn.tag=i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFontSize]];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];

    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //    按钮
    CGFloat btnH=headerH-10;
    CGFloat totalX=15;
    
    for (NSInteger i=0; i<self.btnArray.count; i++) {
        
        CGRect btnRect=[titleArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, btnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:titleFontSize],NSFontAttributeName, nil] context:nil];
        
        UIButton *btn=self.btnArray[i];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFontSize]];
        
        btn.jzl_size=btnRect.size;
        btn.jzl_width = btnRect.size.width+10;
        btn.jzl_x=totalX;
        btn.jzl_y=5;
        btn.jzl_height=btnH;
        totalX=totalX+btnRect.size.width+20;
    }
    
    if (totalX-10<CBScreenW) {
        self.contentSize=CGSizeMake(CBScreenW, 0);
    }else{
        self.contentSize=CGSizeMake(totalX, 0);
    }
}

//通知改变字体
- (void)changeFontSize{
    [self layoutSubviews];
}


@end


@implementation UIView (JZLViewFrame)

- (UIViewController *)jzl_currentVc{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

+ (instancetype)jzl_viewLoadWithXib{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (CGFloat)jzl_x{
    return self.frame.origin.x;
}

- (void)setJzl_x:(CGFloat)jzl_x{
    CGRect frame=self.frame;
    frame.origin.x=jzl_x;
    self.frame=frame;
}

- (CGFloat)jzl_y{
    return self.frame.origin.y;
}

- (void)setJzl_y:(CGFloat)jzl_y{
    CGRect frame=self.frame;
    frame.origin.y=jzl_y;
    self.frame=frame;
}

- (CGFloat)jzl_width{
    return self.frame.size.width;
}

- (void)setJzl_width:(CGFloat)jzl_width{
    CGRect frame=self.frame;
    frame.size.width=jzl_width;
    self.frame=frame;
}

- (CGFloat)jzl_height{
    return self.frame.size.height;
}

- (void)setJzl_height:(CGFloat)jzl_height{
    CGRect frame=self.frame;
    frame.size.height=jzl_height;
    self.frame=frame;
}

- (CGFloat)jzl_right{
    return CGRectGetMaxX(self.frame);
}

- (void)setJzl_right:(CGFloat)jzl_right{
    CGRect frame=self.frame;
    frame.origin.x=jzl_right-frame.size.width;
    self.frame=frame;
}

- (CGFloat)jzl_bottom{
    return CGRectGetMaxY(self.frame);
}

- (void)setJzl_bottom:(CGFloat)jzl_bottom{
    CGRect frame=self.frame;
    frame.origin.y=jzl_bottom-frame.size.height;
    self.frame=frame;
}

- (CGFloat)jzl_centerX{
    return self.center.x;
}

- (void)setJzl_centerX:(CGFloat)jzl_centerX{
    CGPoint center=self.center;
    center.x=jzl_centerX;
    self.center=center;
}

- (CGFloat)jzl_centerY{
    return self.center.y;
}

- (void)setJzl_centerY:(CGFloat)jzl_centerY{
    CGPoint center=self.center;
    center.y=jzl_centerY;
    self.center=center;
}

- (CGSize)jzl_size{
    return self.frame.size;
}

- (void)setJzl_size:(CGSize)jzl_size{
    CGRect frame=self.frame;
    frame.size=jzl_size;
    self.frame=frame;
}
@end



