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

- (IBAction)rock:(id)sender {
	yourImage.image = [UIImage imageNamed:@"rock.jpg"];
}

- (IBAction)paper:(id)sender {
	yourImage.image = [UIImage imageNamed:@"paper.jpg"];
}

- (IBAction)scissors:(id)sender {
	yourImage.image = [UIImage imageNamed:@"scissors.png"];
}

@end
