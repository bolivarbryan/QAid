//
//  BBCompareViewController.m
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import "BBCompareViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BBCompareViewController ()

@end

@implementation BBCompareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    _ImageLayerOne.image = _imgOne;
    _ImageLayerTwo.image = _imgTwo;
    
    UISwipeGestureRecognizer *gestureright = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideBack)];
    [gestureright setDirection:UISwipeGestureRecognizerDirectionRight];
    [gestureright setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:gestureright];
     
    UISwipeGestureRecognizer *gestureUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(makeTransparent)];
    [gestureUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:gestureUp];
    
    UISwipeGestureRecognizer *gestureDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(makeVisible)];
    [gestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:gestureDown];
    
    UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enableGrid)];
    [gestureTap setNumberOfTapsRequired:3];
    [gestureTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:gestureTap];

    
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    LayerOne = [[UIView alloc] initWithFrame:self.view.bounds];
    [LayerOne addSubview:_ImageLayerTwo];
    [LayerOne addSubview:_ImageLayerOne];
    [LayerOne addSubview:_ImageGrid];
    

    
    scrollView.contentSize = self.view.bounds.size;
    [scrollView addSubview:LayerOne];
    
    float minScale  = scrollView.frame.size.width  / self.view.frame.size.width;
    scrollView.minimumZoomScale = minScale;
    scrollView.maximumZoomScale = 2.0;
    scrollView.zoomScale = minScale;
    

}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return LayerOne;
}


//PAN GESTURE
/*
- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    UIView *myView = [gestureRecognizer view];
    CGPoint translate = [gestureRecognizer translationInView:[myView superview]];
    if ([gestureRecognizer state] == UIGestureRecognizerStateChanged || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        
        // See if the new position is in bounds.
        // Figure out where the user is trying to drag the view.
                        [myView setCenter:CGPointMake(myView.center.x + translate.x, myView.center.y + translate.y)];
                        [gestureRecognizer setTranslation:CGPointZero inView:[myView superview]];
  
        

    }
}
*/
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

-(void)enableGrid{
    
    if (_ImageGrid.isHidden)[_ImageGrid setHidden:NO];
    else [_ImageGrid setHidden:YES];
}


//PINCH GESTURE

/*
- (void)handlePinchGesture:(UIPinchGestureRecognizer *)gestureRecognizer {
    if([gestureRecognizer state] == UIGestureRecognizerStateBegan)lastScale = [gestureRecognizer scale];
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        CGFloat currentScale = [[[gestureRecognizer view].layer valueForKeyPath:@"transform.scale"] floatValue];
        const CGFloat kMaxScale = 3.0;
        const CGFloat kMinScale = 1.0;
        CGFloat newScale = 1 -  (lastScale - [gestureRecognizer scale]);
        newScale = MIN(newScale, kMaxScale / currentScale);
        newScale = MAX(newScale, kMinScale / currentScale);
        CGAffineTransform transform = CGAffineTransformScale([[gestureRecognizer view] transform], newScale, newScale);
        [gestureRecognizer view].transform = transform;
        lastScale = [gestureRecognizer scale];
    }
}

*/
-(void)slideBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)makeTransparent{
    if (self.ImageLayerOne.alpha > 0) {
        
        [UIView animateWithDuration:0.5 animations:^(void) {
        [self.ImageLayerOne setAlpha:self.ImageLayerOne.alpha-0.25];
        }];
    }

}

-(void)makeVisible{
    if (self.ImageLayerOne.alpha < 1) {
        [UIView animateWithDuration:0.5 animations:^(void) {
            [self.ImageLayerOne setAlpha:self.ImageLayerOne.alpha+0.25];
        }];
    }
}

-(void)viewDidAppear:(BOOL)animated{

}

-(void)viewWillDisappear:(BOOL)animated{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
