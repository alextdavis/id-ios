//
//  lvlViewController.m
//  simpleGame
//
//  Created by iD Student on 7/31/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "lvlViewController.h"

@interface lvlViewController ()

@end

@implementation lvlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadLevels {
	NSURL *fileURL = [[NSURL alloc] initWithString:@"http://canvas-chicken.herokuapp.com/ios-request"];
	NSData *someData = [[NSData alloc] initWithContentsOfURL:fileURL];
	levelsJSON = [NSJSONSerialization JSONObjectWithData:someData options:kNilOptions error:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	indexPath.row
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadLevels];
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLvlWebView:nil];
	[self setLvlTableView:nil];
    [super viewDidUnload];
}
@end
