//
//  UIView+UIView.m
//  TryMasonry
//
//  Created by 黄洪彬 on 2018/6/13.
//  Copyright © 2018年 黄洪彬. All rights reserved.
//

#import "UIView+UIView.h"
#import <Masonry.h>
@implementation UIView (UIView)

- (void) distributeSpacingHorizontallyWith: (NSArray *) views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity: views.count + 1];
    
    //生成(views.count+1)个宽高相等的空格，用于填充views之间的空隙
    for (int i = 0; i < views.count + 1; i++) {
        UIView *v = [[UIView alloc] init];
        [spaces addObject: v];
        [self addSubview: v];
        
        [v mas_makeConstraints: ^(MASConstraintMaker *make) {
            //width = height
            make.width.equalTo(v.mas_height);
        }];
    }
    
    UIView *v0 = spaces[0];
    
    [v0 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(((UIView *) views[0]).mas_centerY);
    }];
    
    UIView *lastSpace = v0;
    
    for (int i = 0; i < views.count; i++) {
        //从左到右读取view以及space
        UIView *obj = views[i];
        UIView *space = spaces[i + 1];
        [obj mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        
        [space mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            //记得保持水平相等
            make.centerY.equalTo(obj.mas_centerY);
            make.width.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
    }];
}

- (void) distributeSpacingVerticallyWith: (NSArray *) views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity: views.count + 1];
    
    for (int i = 0; i < views.count + 1; i++) {
        UIView *v =[[UIView alloc] init];
        [spaces addObject: v];
        [self addSubview: v];
        [v mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    UIView *v0 = spaces[0];
    
    [v0 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(((UIView *)views[0]).mas_centerX);
    }];
    
    UIView *lastSpace = v0;
    
    for (int i = 0; i < views.count; i++) {
        //从上到下读取view以及space
        UIView *obj = views[i];
        UIView *space = spaces[i + 1];
        
        [obj mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        
        [space mas_makeConstraints: ^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.centerX.equalTo(self.mas_centerX);
            make.height.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
    }];
}
@end
