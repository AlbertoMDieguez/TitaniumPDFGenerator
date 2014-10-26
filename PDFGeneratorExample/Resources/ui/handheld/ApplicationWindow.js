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
	var jsonObject = {
		pdfitems:[]
	};
	
	var offsetY = "20";	
	jsonObject.pdfitems.push({size:"12",color:"#000000",x:"10",y:"10",text:"Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"14",color:"#ff0000",x:"10",y:"10",text:"otra ba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#cccccc",x:"10",y:"10",text:"Álbo es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#000055",x:"10",y:"10",text:"camión España Esta eh dte es el final final"});
	jsonObject.pdfitems.push({size:"14",color:"#ff0000",x:"10",y:"10",text:"otra ba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#cccccc",x:"10",y:"10",text:"Álbo es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#000000",x:"10",y:"10",text:"Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#000000",x:"10",y:"10",text:"Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#000000",x:"10",y:"10",text:"Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"14",color:"#ff0000",x:"10",y:"10",text:"otra ba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});
	jsonObject.pdfitems.push({size:"12",color:"#cccccc",x:"10",y:"10",text:"Álbo es un t Álberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un tÁlberto camión España Esta es otra prueba en la que el texto es un texto super largo y bueno, estamos ahí a hí a ver si lo carga bien de forma dinámica balblablaba ashbhfiuef sdhvsdh dsbdvhv jfv dvjnv dvdv jdsjn sd nsdvsd sdjds sdf sdfnjsdf sdksd f y este es el final final"});

	var file = Ti.Filesystem.getFile(PDFGenerator.generatePDFbyJSON(JSON.stringify(jsonObject)));
	// var file = Ti.Filesystem.getFile(PDFGenerator.generatePDFbyJSONTest("{\"pdfitems\":[{\"text\":\"aaaa\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa1\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa2\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa3\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa4\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa5\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa6\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"},{\"text\":\"aaaa7\",\"size\":\"12\",\"color\":\"000000\",\"x\":\"10\",\"y\":\"10\"}]}"));
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
