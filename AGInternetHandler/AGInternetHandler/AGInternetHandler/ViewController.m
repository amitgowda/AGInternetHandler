//
//  ViewController.m
//  AGInternetHandler
//
//  Created by Lion User on 30/11/2013.
//  Copyright (c) 2013 Amit Gowda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSLog(@"viewdidload");
    AGInternetHandler *agHandle = [[AGInternetHandler alloc] init];
    agHandle.delegate=self;
    [agHandle startRequestWithURL:@"http://google.com" tag:1 andFileName:@"test.txt"];
    
    //For Posting url
    
    itemArray = [NSArray arrayWithObjects:@"1",@"2", nil];
     
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
#pragma mark InternetHandler Delegate methods
-(void)requestSucceded:(id)sender
{
    AGInternetHandler *agHandle =  sender;
    NSLog(@"Request Succeded file contents are %@",agHandle.fileContent);
    
}
-(void)requestFailed:(id)sender
{
    NSLog(@"Request Failed");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Request Failed" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [itemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    // Configure the cell...
    cell.textLabel.text = [itemArray objectAtIndex:indexPath.row];
    
    return cell;
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
