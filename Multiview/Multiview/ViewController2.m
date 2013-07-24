//
//  ViewController2.m
//  Multiview
//
//  Created by iD Student on 7/23/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//NSLog([[NSString alloc] initWithFormat:@"%d", data]);
	label.text = [[NSString alloc] initWithFormat:@"View 2:%d", data];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
