//Application Window Component Constructor
function ApplicationWindow() {
	
	//load component dependencies
	var FirstView = require('ui/common/FirstView');

	//create component instance
	var self = Ti.UI.createWindow({
		backgroundColor:'#ffffff'
	});

	//construct UI
	var firstView = new FirstView();
	self.add(firstView);
	
	var PDFGenerator = require('com.albertomdf.pdfgenerator');

	Ti.API.info(">>"+PDFGenerator.generatePDFbyJSONTest("{json:\"jsondata\",json:\"jsondata1\",json:\"jsondata2\",json:\"jsondata3\"}"));
	var file = Ti.Filesystem.getFile(PDFGenerator.generatePDFbyJSONTest("{json:\"jsondata\"}"));
	var pdfview = Ti.UI.createWebView({width:'100%',height:'100%',data:file});
	var win = Ti.UI.createWindow();
	var close = Ti.UI.createView({top:"10dip",right:"10dip",width:"40dip", height:"40dip",backgroundColor:"green"});
	close.addEventListener('click',function(e){
		win.close();
	});
	win.add(pdfview);
	win.add(close);
	win.open({modal:true});
		

	return self;
}

//make constructor function the public component interface
module.exports = ApplicationWindow;
