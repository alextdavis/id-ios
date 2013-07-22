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
@synthesize view;

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
	view.backgroundColor = [UIColor redColor];
}

- (IBAction)green:(id)sender {
}

- (IBAction)blue:(id)sender {
}

- (IBAction)white:(id)sender {
}

- (IBAction)black:(id)sender {
}

- (IBAction)orange:(id)sender {
}
@end
