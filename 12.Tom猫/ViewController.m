//
//  ViewController.m
//  12.Tom猫
//
//  Created by 罗鲣 on 15/7/3.
//  Copyright (c) 2015年 罗鲣. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController



//**Tom动画方法*/

-(void)tomanimation:(NSString*)img count:(int)count
{
    NSLog(@"123");
    // 如果正在动画，直接返回
    if([self.tom isAnimating])
        return;
    NSMutableArray*arrayM=[NSMutableArray array];//动态数组
    for (int i=0; i<count; i++) {
        
        NSString*imageName=[NSString stringWithFormat:@"%@_%02d.jpg",img,i];
        
        UIImage*image=[UIImage imageNamed:imageName];
        [arrayM addObject:image];
    }
    
    
    [self.tom setAnimationImages:arrayM];
    
    
    
    
    
    //设置动画时长
    [self.tom setAnimationDuration:arrayM.count*0.07];
    
    [self.tom setAnimationRepeatCount:1];
    
    [self.tom startAnimating];

}
- (IBAction)head
{
    
    
    [self tomanimation:@"knockout" count:81];
    
}

- (IBAction)drink
{

    [self tomanimation:@"drink" count:81];
}

@end
