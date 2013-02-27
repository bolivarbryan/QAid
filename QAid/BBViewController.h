//
//  BBViewController.h
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBCompareViewController.h"


@interface BBViewController : UIViewController<UIImagePickerControllerDelegate>{
    UIImagePickerController *imagePickerController;
    BBCompareViewController *compareView;
}

@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;

@property (weak, nonatomic) IBOutlet UIImage *imageGotFromPicker;
@property (weak, nonatomic) IBOutlet UIImage *imageSecondGotFromPicker;

- (IBAction)loadPicture1:(id)sender;
- (IBAction)loadPicture2:(id)sender;
@end
