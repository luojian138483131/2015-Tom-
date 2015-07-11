//
//  ViewController.m
//  12.Tom猫
//
//  Created by 罗鲣 on 15/7/3.
//  Copyright (c) 2015年 罗鲣. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (weak, nonatomic,readonly) IBOutlet UIImageView *tom;

@end

@implementation ViewController

//**Tom动画方法*/

-(void)tomanimation:(NSString*)img count:(int)count
{
    
   
    // 如果正在动画，直接返回
    if([self.tom isAnimating])return;
    
    NSMutableArray*arrayM=[NSMutableArray array];//动态数组
    for (int i=0; i<count; i++) {
        
        NSString*imageName=[NSString stringWithFormat:@"%@_%02d.jpg",img,i];
        
        //UIImage*image=[UIImage imageNamed:imageName];
        NSString*path=[[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage*image=[UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
    }
    
    
    [self.tom setAnimationImages:arrayM];
    
    //设置动画时长
    [self.tom setAnimationDuration:arrayM.count*0.07];
    
    [self.tom setAnimationRepeatCount:1];
    
    [self.tom startAnimating];
    
   /*   1
    //清除数组内容
    [self performSelector:@selector(cleartom) withObject:nil afterDelay:self.tom.animationDuration];//试图控制器执行传空的参数，在TOM猫的时长之后调用 这个cleartom函数
    */
    
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration];
    //Tom猫在动画时长之后，调用一个setAnimations之后传了一个空值

}
/*   2
-(void)cleartom
{
    self.tom.animationImages=nil;
}
*/

- (IBAction)head
{
    
    [self tomanimation:@"knockout" count:81];
    
}
- (IBAction)rightfoot
{
    [self tomanimation:@"footRight" count:29];
}

- (IBAction)drink
{

    [self tomanimation:@"drink" count:81];
}

@end
