/**
 * PDFGenerator
 *
 * Created by Your Name
 * Copyright (c) 2014 Your Company. All rights reserved.
 */

#import <CoreText/CoreText.h>
#import "ComAlbertomdfPdfgeneratorModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComAlbertomdfPdfgeneratorModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"488a5fd3-9a9d-4cc1-8de7-04c612c18ae0";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.albertomdf.pdfgenerator";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(id)generatePDFbyJSON:(id)stringValue
{
    ENSURE_SINGLE_ARG(stringValue,NSString);
    
    //So what we first do is setup file name for the file.
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *pdfFileName = [documentDirectory stringByAppendingPathComponent:@"mypdf.pdf"];
    
    //Once that is done, we can start the graphics context to file and return the context reference so that we can render to it.
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Before we can start drawing anything, we need to mark the beginning of a new page.
    //When you are finished drawing on a page and need to start a new page, just call the
    //same line and reset your offset back to 0 again.
    CGFloat topMargin = 40;
    CGFloat bottomMargin = 40;
    CGFloat pageWidth = 612;
    CGFloat pageHeight = 792;
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageWidth, pageHeight), nil);
    
    //If you are going to generate data that could possibly go over multiple pages,
    //I would recommend to setup a pageOffset before creating a page. You can use this
    //to calculate if you have reached the end of a page, so that you can create a new PDF page context.
    CGFloat pageOffset = 30;
    CGFloat vSize = 17;
    
    
    NSError *errorResult = nil;
    NSData *dataAux = [stringValue dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:dataAux options:0 error:errorResult];
    

    NSError *e = nil;
    NSArray *jsonArray = [json objectForKey:@"pdfitems"];
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", errorResult);
    } else {
        int i=0;
        for(NSDictionary *item in jsonArray) {
            
            pageOffset = pageOffset + [item[@"y"] floatValue];
            NSLog(@"pageOffset: %f", pageOffset);
           
            // NSLog(@"Item: %@", item);
            NSLog(@"TEXT >: %@", item[@"text"]);
            // Hacemos lo que queramos con el objeto
            NSString *myString = [NSString stringWithFormat:@"%@", item[@"text"]];
            
            //Get vertical Size of text (Aprox)
            float lines = myString.length/100.0f; //100 caracteres count aprox
           int intValue = (int)lines;
           if((lines-intValue)>0){
                 intValue++;
            }
            if(intValue>1){
                vSize = 17 * intValue;
            }else{
                vSize = 17;
            }
            
            //Check if needs to create new page
            if((pageOffset+vSize) > (pageHeight-bottomMargin)){
                //New Page and reset page offset
                UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageWidth, pageHeight), nil);
                pageOffset=30;
            }
            
            //Set Color
            unsigned rgbValue = 0;
            NSScanner *scanner = [NSScanner scannerWithString:item[@"color"]];
            [scanner setScanLocation:1]; // bypass '#' character
            [scanner scanHexInt:&rgbValue];
            [[UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0] set];
            //Set font
            NSString *fontName = nil!=item[@"font"]?item[@"font"]:@"HelveticaNeue";
            
            //Draw Rect with text [mystring drawInRect:CGRectMake(x,y,w,h) withFont:UIFont]
            [myString drawInRect:CGRectMake([item[@"x"] intValue],pageOffset==30?topMargin:pageOffset, (pageWidth-2*[item[@"x"] intValue]), vSize) withFont:[UIFont fontWithName:fontName size:[item[@"size"]intValue]] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
            i = i+1;
            
            pageOffset = pageOffset+vSize;
            
            //Cehck if necessary create a new page
           if(pageOffset>(pageHeight-bottomMargin)){
               UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageWidth, pageHeight), nil);
               pageOffset=30;
           }
            
        }
    }
    
    //Finishing the PDF and exporting the data
    //Once you have finished creating your PDF you must first remove the PDF rendering context.
    UIGraphicsEndPDFContext();
    
    NSString *myString = [[NSURL fileURLWithPath:pdfFileName] absoluteString];

    // example method
	return [NSURL fileURLWithPath:pdfFileName];
    
}

@end
