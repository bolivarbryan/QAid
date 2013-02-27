//
//  SecondImage.h
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBViewController.h"

@interface SecondImage : UIViewController<UIImagePickerControllerDelegate>{
        UIImagePickerController *imagePickerController;
        BBViewController *secondView;
}

@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UIImage *imageGotFromPicker;
- (IBAction)loadPicture1:(id)sender;

@end
