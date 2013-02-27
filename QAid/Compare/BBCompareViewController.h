//
//  BBCompareViewController.h
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBCompareViewController : UIViewController<UIScrollViewDelegate>{
    CGFloat lastScale;
    BOOL CanMove;
    UIScrollView *scrollView;
    UIView *LayerOne;

}

@property (nonatomic,retain) UIImage *imgOne;
@property (nonatomic,retain) UIImage *imgTwo;

@property (weak, nonatomic) IBOutlet UIImageView *ImageLayerOne;
@property (weak, nonatomic) IBOutlet UIImageView *ImageLayerTwo;
@property (weak, nonatomic) IBOutlet UIImageView *ImageGrid;


@end
