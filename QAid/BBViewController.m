//
//  BBViewController.m
//  QAid
//
//  Created by Bryan Bolivar on 2/23/13.
//  Copyright (c) 2013 Bryan Bolivar. All rights reserved.
//

#import "BBViewController.h"
#import "BBCompareViewController.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

        self.navigationController.navigationBarHidden = YES;

    
    _firstImageView.image = _imageSecondGotFromPicker;
    
    compareView = [[BBCompareViewController alloc] initWithNibName:@"BBCompareViewController" bundle:Nil];
    imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    UISwipeGestureRecognizer *gestureright = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideBack)];
    [gestureright setDirection:UISwipeGestureRecognizerDirectionRight];
    [gestureright setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:gestureright];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)slideBack{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)loadPicture1:(id)sender {    
    [self presentViewController:imagePickerController animated:YES completion:NULL];
    
}

-(void)viewWillDisappear:(BOOL)animated{

}

- (IBAction)loadPicture2:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue.destinationViewController setImgOne:_imageGotFromPicker];
    [segue.destinationViewController setImgTwo:_imageSecondGotFromPicker];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissModalViewControllerAnimated:YES];
    _imageGotFromPicker= image;
    
    [self performSegueWithIdentifier:@"ComparePicureModal" sender:self];
    
}

@end
