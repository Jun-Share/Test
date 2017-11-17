//
//  UITableView+ZMReLoad.h
//  ZMClient
//
//  Created by apple on 16/11/8.
//  Copyright © 2016年 Perch Communications. All rights reserved.
//
typedef enum : NSUInteger {
    NoNetWorkType = 0,
    NoContentType,
    NoMessageType,
    NoArgumentType,
    NoStarType,
    NoTopicType,
    NoAttentionType
} TipType;
#import <UIKit/UIKit.h>
typedef void(^ReloadBlock)();
@interface ReloadImageView : UIImageView
@property (nonatomic,copy) ReloadBlock   reloadBlock;
@end
@interface JumpBtn : UIButton
@property (nonatomic,copy) ReloadBlock   reloadBlock;
@end
/**
 控件的显隐性需要自己在代码里控制backView的hidden属性
 */
@interface UIView (ZMReLoad)
@property (nonatomic,strong) ReloadImageView    * ms_backView;
@property (nonatomic,strong) ReloadImageView    *   ms_netWorkImageView;//162*178
@property (nonatomic,strong) UILabel    * ms_noDataTipLabel;
@property (nonatomic,strong) JumpBtn    * ms_jumpBtn;
#pragma mark-----------老接口，简单的提供无网络和无数据提示
/**
 无网络提示
 */
- (void)addReloadViewWithReloadBlock:(ReloadBlock)block;
/**
 无数据提示
 */
- (void)addnoDateTipLabel;


#pragma mark-----------新接口
/**
 实现这个方法，才会初始化控件
 @param block 重载block
 @param jumpBlock 跳转block（点击按钮触发跳转）
 */
- (void)addReloadViewWithReloadBlock:(ReloadBlock)block andJumpBlock:(ReloadBlock)jumpBlock;
/**
 根据类型更新（不设置，默认NoNetWorkType）

 @param type 类型
 */
- (void)updateWithType:(TipType)type;
/**
 自己定义图片，提示文字，按钮文字

 @param imageName 图片名字
 @param tipString 提示文字
 @param btnTitle 按钮文字
 */
- (void)updateImageName:(NSString *)imageName tipString:(NSString *)tipString btnTitleString:(NSString *)btnTitle;
/**
 调整坐标

 @param originY y坐标
 */
- (void)updateImageOriginY:(CGFloat)originY;
@end
