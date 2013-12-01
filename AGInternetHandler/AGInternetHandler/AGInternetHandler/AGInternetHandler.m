//
//  AGInternetHandler.m
//  AGInternetHandler
//
//  Created by Lion User on 30/11/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AGInternetHandler.h"
#define FILEPATH @"%@/Documents/%@"

@implementation AGInternetHandler
@synthesize tag,fileName,delegate,fileContent;

-(void)addLoadingView
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    loadingView = [[UIView alloc] initWithFrame:keyWindow.frame];
    loadingView.backgroundColor = [UIColor clearColor];
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    loadingLabel.layer.cornerRadius=10;
    loadingLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    loadingLabel.text =@"Loading...";
    loadingLabel.textColor=[UIColor whiteColor];
    loadingLabel.textAlignment= UITextAlignmentCenter;
    [loadingView addSubview:loadingLabel];
    loadingLabel.center = loadingView.center;
    [keyWindow addSubview:loadingView];
}
-(void)startRequestWithURL:(NSString *)url tag:(int)tg andFileName:(NSString *)fileN
{
    NSLog(@"startrequest");
    [self performSelector:@selector(addLoadingView) withObject:nil afterDelay:0.1];
    
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:self];
    if(connection)
    {
        tag=tg;
        fileName=fileN;
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    responseData = [[NSMutableData alloc] init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [loadingView removeFromSuperview];
    
    NSLog(@"xcxcx");
    NSString *filePath = [NSString stringWithFormat:FILEPATH,NSHomeDirectory(),fileName];
    NSLog(@"filePath %@",filePath);
    [responseData writeToFile:filePath atomically:YES];
    
    fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [delegate requestSucceded:self];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [loadingView removeFromSuperview];
    [delegate requestFailed:self];
}
-(void)dealloc
{
    [responseData release];
    [super dealloc];
}
@end
