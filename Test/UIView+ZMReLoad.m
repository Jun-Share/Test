//
//  UITableView+ZMReLoad.m
//  ZMClient
//
//  Created by apple on 16/11/8.
//  Copyright © 2016年 Perch Communications. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+ZMReLoad.h"
@implementation ReloadImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reloadTheData)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)reloadTheData {
    if (_reloadBlock) {
        _reloadBlock();
    }
}
@end
@implementation JumpBtn
@end
@implementation UIView (ZMReLoad)
@dynamic ms_netWorkImageView;
@dynamic ms_noDataTipLabel;
@dynamic ms_backView;
@dynamic ms_jumpBtn;

static NSString const * networkKey = @"networkkey";
static NSString const * nodataKey = @"noDataKey";
static NSString const * jumpBtnKey = @"jumpBtnKey";
static NSString const * backViewKey = @"backViewKey";

#pragma mark--------绑定属性---------------------
- (void)setMs_backView:(ReloadImageView *)ms_backView {
    if (ms_backView != self.ms_backView) {
        [self.ms_backView removeFromSuperview];
        [self insertSubview:ms_backView atIndex:0];
        objc_setAssociatedObject(self, &backViewKey,
                                 ms_backView, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (ReloadImageView *)ms_backView {
    return objc_getAssociatedObject(self, &backViewKey);
}

- (void)setMs_netWorkImageView:(ReloadImageView *)ms_netWorkImageView {
    if (ms_netWorkImageView != self.ms_netWorkImageView) {
        [self.ms_netWorkImageView removeFromSuperview];
        [self insertSubview:ms_netWorkImageView atIndex:0];
        objc_setAssociatedObject(self, &networkKey,
                                 ms_netWorkImageView, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (ReloadImageView *)ms_netWorkImageView {
    return objc_getAssociatedObject(self, &networkKey);
}

- (void)setMs_noDataTipLabel:(UILabel *)ms_noDataTipLabel {
    if (ms_noDataTipLabel != self.ms_noDataTipLabel) {
        [self.ms_noDataTipLabel removeFromSuperview];
        [self insertSubview:ms_noDataTipLabel atIndex:0];
        objc_setAssociatedObject(self, &nodataKey,
                                 ms_noDataTipLabel, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (UILabel *)ms_noDataTipLabel {
    return objc_getAssociatedObject(self, &nodataKey);
}

- (void)setMs_jumpBtn:(UIButton *)ms_jumpBtn {
    if (ms_jumpBtn != self.ms_jumpBtn) {
        [self.ms_jumpBtn removeFromSuperview];
        [self insertSubview:ms_jumpBtn atIndex:0];
        objc_setAssociatedObject(self, &jumpBtnKey,
                                 ms_jumpBtn, OBJC_ASSOCIATION_ASSIGN);
    }
    
}

- (UIButton *)ms_jumpBtn {
    return objc_getAssociatedObject(self, &jumpBtnKey);
}

- (void)addReloadViewWithReloadBlock:(ReloadBlock)block andJumpBlock:(ReloadBlock)jumpBlock {
    ReloadImageView * backgroundview = [[ReloadImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    backgroundview.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    backgroundview.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    backgroundview.hidden = YES;
    backgroundview.userInteractionEnabled = YES;
    self.ms_backView = backgroundview;
    backgroundview.reloadBlock = block;
    [self addSubview:self.ms_backView];
    
    ReloadImageView * imageView = [[ReloadImageView alloc]initWithImage:[UIImage imageNamed:@"blank_network"]];
    imageView.center = CGPointMake(backgroundview.ms_width/2.0, 120+imageView.ms_height/2.0);
    imageView.contentMode = UIViewContentModeCenter;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin;
    imageView.userInteractionEnabled = NO;
    self.ms_netWorkImageView = imageView;
    [backgroundview addSubview:self.ms_netWorkImageView];
    
    UILabel * nodata = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView.frame)+11, backgroundview.ms_width-20, 50)];
    nodata.text = @"呀！网络加载失败了……";
    nodata.textAlignment = NSTextAlignmentCenter;
    nodata.font = [UIFont systemFontOfSize:15];
    nodata.numberOfLines = 2;
    nodata.textColor =  [UIColor colorWithHexString:@"#999999"];
    nodata.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
                                  UIViewAutoresizingFlexibleRightMargin;
    self.ms_noDataTipLabel = nodata;
    [backgroundview addSubview:nodata];
    
    JumpBtn * jumbtn = [[JumpBtn alloc]initWithFrame:CGRectMake((backgroundview.ms_width-290/2.0)/2.0, CGRectGetMaxY(nodata.frame)+25, 290/2.0, 33)];
    [jumbtn setTitle:@"马上预约" forState:UIControlStateNormal];
    [jumbtn setTitleColor:[UIColor colorWithHexString:@""] forState:UIControlStateNormal];
    jumbtn.layer.borderWidth = 1;
    jumbtn.layer.borderColor = [[UIColor colorWithHexString:@""]  CGColor];
    jumbtn.layer.cornerRadius = 5;
    jumbtn.layer.masksToBounds = YES;
    jumbtn.reloadBlock = jumpBlock;
    jumbtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
                                  UIViewAutoresizingFlexibleRightMargin;
    jumbtn.hidden = YES;
    self.ms_jumpBtn = jumbtn;
    [jumbtn addTarget:self action:@selector(goToOtherVc) forControlEvents:UIControlEventTouchUpInside];
    [backgroundview addSubview:jumbtn];
}

-(void)goToOtherVc {
    if (self.ms_jumpBtn.reloadBlock) {
        self.ms_jumpBtn.reloadBlock();
    }
}
#pragma mark--------------public--------------------
- (void)updateWithType:(TipType)type {
    switch (type) {
        case NoNetWorkType:
            [self updateImageName:@"no_netWork" tipString:@"哎呀！网络不太稳定请点击屏幕刷新" btnTitleString:nil];
            break;
        case NoStarType:
            [self updateImageName:@"no_star" tipString:@"哎呀，还没有收藏" btnTitleString:nil];
            break;
        case NoTopicType:
            [self updateImageName:@"no_topic" tipString:@"哎呀,您还没有发过帖子" btnTitleString:nil];
            break;
        case NoContentType:
            [self updateImageName:@"no_content" tipString:@"暂无内容" btnTitleString:nil];
            break;
        case NoMessageType:
            [self updateImageName:@"no_message" tipString:@"哎呀，没有消息通知" btnTitleString:nil];
            break;
        case NoArgumentType:
            [self updateImageName:@"no_argument" tipString:@"还没有评论呢" btnTitleString:nil];
            break;
        case NoAttentionType:
            [self updateImageName:@"no_attention" tipString:@"还没有关注的人" btnTitleString:nil];
            break;
        default:
            break;
    }
}

- (void)updateImageName:(NSString *)imageName tipString:(NSString *)tipString btnTitleString:(NSString *)btnTitle {
    self.ms_backView.hidden = NO;
    if ([imageName isEqualToString:@"no_netWork"]) {
        self.ms_backView.userInteractionEnabled = YES;
    }
    else {
        self.ms_backView.userInteractionEnabled = NO;
    }
    self.ms_netWorkImageView.image = [UIImage imageNamed:imageName];
    self.ms_noDataTipLabel.text = tipString;
    if(btnTitle.length>0) {
        self.ms_jumpBtn.hidden = NO;
        [self.ms_jumpBtn setTitle:btnTitle forState:UIControlStateNormal];
    }
    else {
        self.ms_jumpBtn.hidden = YES;
    }
}

- (void)updateImageOriginY:(CGFloat)originY {
    self.ms_netWorkImageView.center = CGPointMake(self.ms_backView.ms_width/2.0, originY+self.ms_netWorkImageView.ms_height/2.0);
    self.ms_noDataTipLabel.frame = CGRectMake(10, CGRectGetHeight(self.ms_netWorkImageView.frame)+originY+11, self.ms_backView.ms_width-20, 50);
    self.ms_jumpBtn.frame = CGRectMake((self.ms_backView.ms_width-290/2.0)/2.0, CGRectGetMaxY(self.ms_noDataTipLabel.frame)+25, 290/2.0, 33);
}
#pragma mark-------------无网络提示
- (void)addReloadViewWithReloadBlock:(ReloadBlock)block {// 162*178
    ReloadImageView * imageView = [[ReloadImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    imageView.hidden = YES;//默认隐藏
    imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
    imageView.image = [UIImage imageNamed:@"blank_network"];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.userInteractionEnabled = YES;
    imageView.reloadBlock = block;
    self.ms_netWorkImageView = imageView;
    [self addSubview:self.ms_netWorkImageView];
}
#pragma mark-------------无数据提示
- (void)addnoDateTipLabel {
    UILabel * nodata = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width-150)/2.0, (self.frame.size.height - 44)/2.0, 150, 44)];
    nodata.text = @"暂无数据";
    nodata.textAlignment = NSTextAlignmentCenter;
    nodata.hidden = YES;//默认隐藏
    nodata.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;;
    nodata.textColor =  [UIColor colorWithHexString:@"#ABABAB"];
    self.ms_noDataTipLabel = nodata;
    [self addSubview:nodata];
}
@end
