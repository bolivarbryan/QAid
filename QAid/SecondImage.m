//
//  SecondImage.m
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import "SecondImage.h"

@interface SecondImage ()

@end

@implementation SecondImage


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

    
    secondView= [[BBViewController alloc] initWithNibName:@"BBViewController" bundle:Nil];
    imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    
}

-(void)viewWillAppear:(BOOL)animated{
        self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadPicture1:(id)sender {
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue.destinationViewController setImageSecondGotFromPicker:_imageGotFromPicker];
}


- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissModalViewControllerAnimated:YES];
    _imageGotFromPicker= image;
    
    
    _firstImage.image=image;
    
    [self performSegueWithIdentifier:@"SecondImageSegue" sender:self];


    
}
@end
