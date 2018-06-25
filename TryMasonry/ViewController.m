//
//  ViewController.m
//  TryMasonry
//
//  Created by 黄洪彬 on 2018/6/13.
//  Copyright © 2018年 黄洪彬. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "UIView+UIView.m"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化subView
    UIView *sv = [[UIView alloc] init];
    sv.backgroundColor = [UIColor blackColor];

    //添加subView
    [self.view addSubview: sv];

    //为subView添加约束
    [sv mas_makeConstraints: ^(MASConstraintMaker *make) {
        //居中约束
        make.center.equalTo(self.view);

        //尺寸约束
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
//
//    UIView *sv1 = [[UIView alloc] init];
//    sv1.backgroundColor = [UIColor redColor];
//
//    [sv addSubview: sv1];
//
//    [sv1 mas_makeConstraints: ^(MASConstraintMaker *make) {
//        //方法1
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//
//        //方法2
//        make.top.equalTo(sv).with.offset(10);
//        make.left.equalTo(sv).with.offset(10);
//        make.bottom.equalTo(sv).with.offset(-10);
//        make.right.equalTo(sv).with.offset(-10);
//
//        //方法3
//        make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
//    int padding1 = 10;
//
//    UIView *sv2 = [[UIView alloc] init];
//    UIView *sv3 = [[UIView alloc] init];
//    sv2.backgroundColor = [UIColor orangeColor];
//    sv3.backgroundColor = [UIColor orangeColor];
//
//    [self.view addSubview: sv2];
//    [self.view addSubview: sv3];
//
//    [sv2 mas_makeConstraints: ^(MASConstraintMaker *make) {
//        //令纵向中点相等
//        make.centerY.equalTo(sv.mas_centerY);
//
//        //距离左边10
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//
//        //两者间距10
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//
//        //设置sv2高度
//        make.height.equalTo(@150);
//
//        //和sv3等宽
//        make.width.equalTo(sv3);
//    }];
//    [sv3 mas_makeConstraints: ^(MASConstraintMaker *make) {
//        //令纵向中点相等
//        //以下两者等价
//    //      make.centerY.mas_equalTo(sv.mas_centerY);
//        make.centerY.equalTo(sv.mas_centerY);
//
//        //左边距离sv2的右边10
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//
//        //右边距离sv的右边10
//        //以下两者等价
//    //        make.right.mas_equalTo(sv.mas_right).with.offset(-padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//
//        //设置sv3高度
//        //以下两者等价
//    //        make.height.mas_equalTo(150);
//        make.height.equalTo(@150);
//
//        //和sv2等宽
//        //以下两者等价
//    //        make.width.equalTo(sv2);
//        make.width.equalTo(sv2.mas_width);
//    }];
    
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.backgroundColor = [UIColor whiteColor];
//    [sv addSubview: scrollView];
//    [scrollView mas_makeConstraints: ^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
//    }];
//
//
//    UIView *container = [[UIView alloc] init];
//    [scrollView addSubview: container];
//
//    UIView *lastView = nil;
//
//    [container mas_makeConstraints: ^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.width.equalTo(scrollView);
//    }];
//
//    int count = 10;
//
//    for (int i = 1; i <= count; i++) {
//        UIView *thisView = [[UIView alloc] init];
//        [container addSubview: thisView];
//        thisView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
//                                              saturation:( arc4random() % 128 / 256.0 ) + 0.5
//                                              brightness:( arc4random() % 128 / 256.0 ) + 0.5
//                                                   alpha:1];
//        [thisView mas_makeConstraints: ^(MASConstraintMaker *make) {
//            make.width.equalTo(container);
//            make.left.and.right.equalTo(container);
//            make.height.equalTo(@(20 * i));
//            if (lastView) {
//                //lastView为上一个view，则接着上一个view
//                make.top.equalTo(lastView.mas_bottom);
//            }
//            else {
//                make.top.equalTo(container.mas_top);
//            }
//        }];
//        lastView = thisView;
//    }
//
//    [container mas_makeConstraints: ^(MASConstraintMaker *make) {
//        make.bottom.equalTo(lastView.mas_bottom);
//    }];
    
    UIView *fatherView = [[UIView alloc] init];
    UIView *verView1 = [[UIView alloc] init];
    UIView *verView2 = [[UIView alloc] init];
    UIView *horView1 = [[UIView alloc] init];
    UIView *horView2 = [[UIView alloc] init];
    
    [sv addSubview: fatherView];
    [sv addSubview: verView1];
    [sv addSubview: verView2];
    [sv addSubview: horView1];
    [sv addSubview: horView2];
    
    fatherView.backgroundColor = [UIColor redColor];
    verView1.backgroundColor = [UIColor redColor];
    verView2.backgroundColor = [UIColor redColor];
    horView1.backgroundColor = [UIColor redColor];
    horView2.backgroundColor = [UIColor redColor];
    
    [fatherView mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.centerX.equalTo(@[verView1, verView2]);
        make.centerY.equalTo(@[horView1, horView2]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [verView1 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [verView2 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [horView1 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [horView2 mas_makeConstraints: ^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv distributeSpacingVerticallyWith: @[fatherView, verView1, verView2]];
    [sv distributeSpacingHorizontallyWith: @[fatherView, horView1, horView2]];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
