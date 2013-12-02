//
//  AGInternetHandler.h
//  AGInternetHandler
//
//  Created by Lion User on 30/11/2013.
//  Copyright (c) 2013 Amit Gowda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@protocol AGInternetHandlerDelegate <NSObject>

@optional
-(void)requestSucceded:(id)sender;
-(void)requestFailed:(id)sender;

@end

@interface AGInternetHandler : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    UIView *loadingView;
    NSMutableData *responseData;
    int tag;
    NSString *fileName, *fileContent;
    id <AGInternetHandlerDelegate> delegate;
}
-(void)startRequestWithURL:(NSString *)url tag:(int)tg andFileName:(NSString*)fileN;
-(void)startPostRequest:(NSString *)url withParam:(NSString *)param;
@property(nonatomic,assign)id <AGInternetHandlerDelegate> delegate;
@property(nonatomic,assign)int tag;
@property(nonatomic,assign)NSString *fileName, *fileContent;
@end
