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

	NSURL *serverURL = [NSURL URLWithString: [[NSString alloc] initWithFormat:@"http://apps.tinytech.us/R7GNJI27I9/?Method=0x01"]];
	
	NSData *serverResponse = [NSData dataWithContentsOfURL:serverURL];
	
	NSError *error = nil;
	
	NSDictionary* json = [NSJSONSerialization JSONObjectWithData:serverResponse options:kNilOptions error:&error];
	
	highScoresName = [json objectForKey:@"Users"];
	highScoresValue = [json objectForKey:@"Score"];
	
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [highScoresName count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	cell.textLabel.text = [highScoresName objectAtIndex:indexPath.row];
	UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(232,11,68,21)];
	scoreLabel.text = [highScoresValue objectAtIndex:indexPath.row];
	[cell addSubview:scoreLabel];
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}


@end
