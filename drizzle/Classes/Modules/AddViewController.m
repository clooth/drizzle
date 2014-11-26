//
//  AddViewController.m
//  drizzle
//
//  Created by Nico Hämäläinen on 26/11/14.
//  Copyright (c) 2014 sizeof.io. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *locationNameField;

@end

@implementation AddViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(dismiss)];

    [self.transitioningBackgroundView addGestureRecognizer:tapRecognizer];
    [self.transitioningBackgroundView setUserInteractionEnabled:YES];

    [self.locationNameField becomeFirstResponder];
}

- (void)dismiss
{
    [self.eventHandler cancelAddAction];
}

- (void)setLocationName:(NSString *)locationName
{
    self.locationNameField.text = locationName;
}

- (IBAction)save:(id)sender
{
    [self.eventHandler saveAddActionWithLocationName:self.locationNameField.text];
}

- (IBAction)cancel:(id)sender
{
    [self.eventHandler cancelAddAction];
}

#pragma mark  UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}

@end
