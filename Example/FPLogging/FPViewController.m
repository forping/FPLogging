//
//  FPViewController.m
//  FPLogging
//
//  Created by aiyanbo on 12/25/2020.
//  Copyright (c) 2020 aiyanbo. All rights reserved.
//

#import "FPViewController.h"
#import <FPLogging/FPLogging.h>

@interface FPViewController ()

@end

@implementation FPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [[FPLoggingTool sharedInstance] logInfo:@"日志1"];
    [[FPLoggingTool sharedInstance] logInfo:@"日志2"];
    [[FPLoggingTool sharedInstance] logInfo:@"日志3"];
    [[FPLoggingTool sharedInstance] logInfo:@"日志4"];
    [[FPLoggingTool sharedInstance] logInfo:@"日志5"];
    
    NSLog(@"%@",[[FPLoggingTool sharedInstance] filePath]);
    
    NSString *str = [[NSString alloc] initWithContentsOfFile:[[FPLoggingTool sharedInstance] filePath] encoding:NSUTF8StringEncoding error:NULL];
    
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
