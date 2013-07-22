//
//  ViewController.m
//  changeColor
//
//  Created by iD Student on 7/22/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)red:(id)sender {
	[viewBackground setBackgroundColor:[UIColor redColor]];
}

- (IBAction)green:(id)sender {
	[viewBackground setBackgroundColor:[UIColor greenColor]];
}

- (IBAction)blue:(id)sender {
	[viewBackground setBackgroundColor:[UIColor blueColor]];
}

@end
