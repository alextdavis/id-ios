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

int aiScoreN = 0;
int yourScoreN = 0;

- (int) rpsAI
{
	int leRandom = arc4random() % 3;
	if (leRandom == 0)
	{
		aiImage.image = [UIImage imageNamed:@"rock.jpg"];
	}
	else if (leRandom == 1)
	{
		aiImage.image = [UIImage imageNamed:@"paper.jpg"];
	}
	else if (leRandom ==2)
	{
		aiImage.image = [UIImage imageNamed:@"scissors.png"];
	}
	return leRandom;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	result.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rock:(id)sender {
	yourImage.image = [UIImage imageNamed:@"rock.jpg"];
	int aiChoice = [self rpsAI];
	
	if (aiChoice == 1) {
		result.text = @"You Loose!";
		aiScoreN++;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
	}
	else if (aiChoice == 2) {
		result.text = @"You Win!";
		yourScoreN++;
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	} 
	else if (aiChoice == 0) {
		result.text = @"It's a Draw!";
	}
	if (yourScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Won!" message:@"You have won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
	else if (aiScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:@"The AI has won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
}

- (IBAction)paper:(id)sender {
	yourImage.image = [UIImage imageNamed:@"paper.jpg"];
	int aiChoice = [self rpsAI];
	if (aiChoice == 2) {
		result.text = @"You Loose!";
		aiScoreN++;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];

	}
	else if (aiChoice == 0) {
		result.text = @"You Win!";
		yourScoreN++;
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
	else if (aiChoice == 1) {
		result.text = @"It's a Draw!";
	}
	if (yourScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Won!" message:@"You have won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
	else if (aiScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:@"The AI has won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
}

- (IBAction)scissors:(id)sender {
	yourImage.image = [UIImage imageNamed:@"scissors.png"];
	int aiChoice = [self rpsAI];
	if (aiChoice == 0) {
		result.text = @"You Loose!";
		aiScoreN++;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
	}
	else if (aiChoice == 1) {
		result.text = @"You Win!";
		yourScoreN++;
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
	else if (aiChoice == 2) {
		result.text = @"It's a Draw!";
	}
	if (yourScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Won!" message:@"You have won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
	else if (aiScoreN >= 10) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:@"The AI has won 10 points!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[alert show];
		yourScoreN = 0;
		aiScoreN = 0;
		aiScore.text = [[NSString alloc] initWithFormat:@"Ai: %d", aiScoreN];
		yourScore.text = [[NSString alloc] initWithFormat:@"You: %d", yourScoreN];
	}
}

@end
