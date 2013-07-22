//
//  IDDDViewController.m
//  Hello World
//
//  Created by iD Student on 7/22/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "IDDDViewController.h"

@interface IDDDViewController ()

@end

@implementation IDDDViewController
@synthesize hiLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sayHi:(id)sender {
	hiLabel.text = @"Hi";
}
@end
