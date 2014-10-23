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
-(id)generatePDFbyJSONTest:(NSString *)stringValue
{
    //So what we first do is setup file name for the file.
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *pdfFileName = [documentDirectory stringByAppendingPathComponent:@"mypdf.pdf"];
    
    //Once that is done, we can start the graphics context to file and return the context reference so that we can render to it.
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Before we can start drawing anything, we need to mark the beginning of a new page. When you are finished drawing on a page and need to start a new page, just call the same line and reset your offset back to 0 again.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    //If you are going to generate data that could possibly go over multiple pages, I would recommend to setup a pageOffset before creating a page. You can use this to calculate if you have reached the end of a page, so that you can create a new PDF page context.
    CGFloat pageOffset = 20;
    
    NSData *data = [stringValue dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                             error: nil];
    int i=0;
    for (id objeto in jsonResponse) {
        // Hacemos lo que queramos con el objeto
        NSString *myString = [NSString stringWithFormat:@">%@", objeto];
        [myString drawInRect:CGRectMake(20, i*pageOffset, 200, 34) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
        i = i+1;
    }
    for(int n = 1; n <= 10; n = n + 1){
        
        NSString *myString = [NSString stringWithFormat:@"%@", stringValue];
        [myString drawInRect:CGRectMake(20, n*pageOffset, 200, 34) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
    }
   
    //Finishing the PDF and exporting the data
    //Once you have finished creating your PDF you must first remove the PDF rendering context.
    UIGraphicsEndPDFContext();
    
    // example method
	return [NSURL fileURLWithPath:pdfFileName];

}

-(id)generatePDFbyJSON:(NSArray *)arrayValues
{
    //Create a PDF filename for a file that will reside in the Documents folder.

    //NSString *fileName = [NSString stringWithFormat:@"%@.pdf",name];
    NSString *fileName = @"PlanDeParto.pdf";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];

    for(int n = 0; n <= 10; n = n + 1){
        //>>Creates a “Hello world” string that we will draw onto the PDF.
        //It also converts the string to its CoreGraphics counterpart, CFStringRef.
        NSString* textToDraw = @"España Camión Número ";
        CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
    
        //Prepare the text using a Core Text Framesetter.
        CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
        //>>Now we create a CGRect that defines the frame where the text will be drawn.
        CGRect frameRect = CGRectMake(0,n*10, 300, 50);
        CGMutablePathRef framePath = CGPathCreateMutable();
        CGPathAddRect(framePath, NULL, frameRect);
    
        // Get the frame that will do the rendering.
        CFRange currentRange = CFRangeMake(0, n*10);
        CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
        CGPathRelease(framePath);
    
        //>>Next we create a PDF context and mark the beginning of a PDF page.
        //>>Each page of the PDF has to start with a call to UIGraphicsBeginPDFPageWithInfo.
        // Create the PDF context using the default page size of 612 x 792.
        UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
        // Get the graphics context.
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
        //>>The coordinates of Core Graphics drawings start from the bottom-left corner,
        //>>while UIKit global coordinates start from the top-left. We need to flip the context before we begin drawing.
        // Put the text matrix into a known state. This ensures
        // that no old scaling factors are left in place.
        CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
        // Core Text draws from the bottom-left corner up, so flip
        // the current transform prior to drawing.
        CGContextTranslateCTM(currentContext, 0, 100);
        CGContextScaleCTM(currentContext, 1.0, -1.0);
    
        //>>We draw the actual frame with the text, release all the Core Graphics objects, and close the PDF context (hence writing the PDF to disk).
    
        // Draw the frame.
        CTFrameDraw(frameRef, currentContext);
    
        CFRelease(frameRef);
        CFRelease(stringRef);
        CFRelease(framesetter);
    }
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
    
	// example method
	return [NSURL fileURLWithPath:pdfFileName];
}
-(void) addText:(NSString *) textValue
{
    
}


-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
