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
@synthesize parentViewController;


- (void)loadLevels {
	
	NSURL *fileURL = [[NSURL alloc] initWithString:@"http://canvas-chicken.herokuapp.com/ios-request"];
	NSData *someData = [[NSData alloc] initWithContentsOfURL:fileURL];
	
	NSDictionary *jsonParser = [NSJSONSerialization JSONObjectWithData:someData options:kNilOptions error:nil];

	NSLog(@"Server Response: %@", [[NSString alloc] initWithBytes:[someData bytes] length:[someData length] encoding:NSUTF8StringEncoding]);
	
	titleArray = [jsonParser objectForKey:@"title"];
	pointArray = [jsonParser objectForKey:@"points"];
	errorArray = [jsonParser objectForKey:@"error"];
	urlArray = [jsonParser objectForKey:@"url"];
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [titleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//	[cell.textLabel setText:titleArray[indexPath.row]];
//	[cell.detailTextLabel setText:@"9001"];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	
	if(cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
	}
	
	cell.textLabel.text = titleArray[indexPath.row];
	if ([errorArray[indexPath.row] isEqual:@"404"]) {
		cell.detailTextLabel.text = @"ERR: 404 (level not available)";
	}
	else {
		cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"%@", pointArray[indexPath.row]];
	}
	return cell;
}
  
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Selected");
	NSURL *lvlURL = [[NSURL alloc]initWithString:urlArray[indexPath.row]];
	NSData *lvlData = [[NSData alloc] initWithContentsOfURL:lvlURL];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName = [[NSString alloc]initWithFormat:@"%@.json",titleArray[indexPath.row]];
	NSString *filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory,fileName];
	[lvlData writeToFile:filePath atomically:YES];
	
	[appSettings setValue:filePath forKey:titleArray[indexPath.row]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	appSettings = [NSUserDefaults standardUserDefaults];
	
	[self loadLevels];
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
//    [self setLvlWebView:nil];
//	[self setLvlTableView:nil];
    [super viewDidUnload];
}
- (IBAction)done:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
