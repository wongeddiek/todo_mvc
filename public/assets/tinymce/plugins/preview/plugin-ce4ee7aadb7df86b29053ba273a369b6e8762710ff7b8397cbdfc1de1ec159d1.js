!function(){var e={},t=function(t){for(var n=e[t],r=n.deps,o=n.defn,a=r.length,c=new Array(a),d=0;d<a;++d)c[d]=i(r[d]);var u=o.apply(null,c);if(void 0===u)throw"module ["+t+"] returned undefined";n.instance=u},n=function(t,n,i){if("string"!=typeof t)throw"module id must be a string";if(void 0===n)throw"no dependencies for "+t;if(void 0===i)throw"no definition function for "+t;e[t]={deps:n,defn:i,instance:void 0}},i=function(n){var i=e[n];if(void 0===i)throw"module ["+n+"] was undefined";return void 0===i.instance&&t(n),i.instance},r=function(e,t){for(var n=e.length,r=new Array(n),o=0;o<n;++o)r[o]=i(e[o]);t.apply(null,r)};({}).bolt={module:{api:{define:n,require:r,demand:i}}};var o=n;(function(e,t){o(e,[],function(){return t})})("4",tinymce.util.Tools.resolve),o("1",["4"],function(e){return e("tinymce.PluginManager")}),o("6",["4"],function(e){return e("tinymce.Env")}),o("7",["4"],function(e){return e("tinymce.util.Tools")}),o("8",[],function(){return{getPreviewDialogWidth:function(e){return parseInt(e.getParam("plugin_preview_width","650"),10)},getPreviewDialogHeight:function(e){return parseInt(e.getParam("plugin_preview_height","500"),10)},getContentStyle:function(e){return e.getParam("content_style","")}}}),o("9",["7","8"],function(e,t){var n=function(n){var i="",r=n.dom.encode,o=t.getContentStyle(n);i+='<base href="'+r(n.documentBaseURI.getURI())+'">',o&&(i+='<style type="text/css">'+o+"</style>"),e.each(n.contentCSS,function(e){i+='<link type="text/css" rel="stylesheet" href="'+r(n.documentBaseURI.toAbsolute(e))+'">'});var a=n.settings.body_id||"tinymce";-1!==a.indexOf("=")&&(a=n.getParam("body_id","","hash"),a=a[n.id]||a);var c=n.settings.body_class||"";-1!==c.indexOf("=")&&(c=n.getParam("body_class","","hash"),c=c[n.id]||"");var d='<script>document.addEventListener && document.addEventListener("click", function(e) {for (var elm = e.target; elm; elm = elm.parentNode) {if (elm.nodeName === "A") {e.preventDefault();}}}, false);</script> ',u=n.settings.directionality?' dir="'+n.settings.directionality+'"':"";return"<!DOCTYPE html><html><head>"+i+'</head><body id="'+r(a)+'" class="mce-content-body '+r(c)+'"'+r(u)+">"+n.getContent()+d+"</body></html>"};return{getPreviewHtml:n,injectIframeContent:function(e,t,i){var r=n(e);if(i)t.src="data:text/html;charset=utf-8,"+encodeURIComponent(r);else{var o=t.contentWindow.document;o.open(),o.write(r),o.close()}}}}),o("5",["6","7","8","9"],function(e,t,n,i){return{open:function(t){var r=!e.ie,o='<iframe src="javascript:\'\'" frameborder="0"'+(r?' sandbox="allow-scripts"':"")+"></iframe>",a=n.getPreviewDialogWidth(t),c=n.getPreviewDialogHeight(t);t.windowManager.open({title:"Preview",width:a,height:c,html:o,buttons:{text:"Close",onclick:function(e){e.control.parent().parent().close()}},onPostRender:function(e){var n=e.control.getEl("body").firstChild;i.injectIframeContent(t,n,r)}})}}}),o("2",["5"],function(e){return{register:function(t){t.addCommand("mcePreview",function(){e.open(t)})}}}),o("3",[],function(){return{register:function(e){e.addButton("preview",{title:"Preview",cmd:"mcePreview"}),e.addMenuItem("preview",{text:"Preview",cmd:"mcePreview",context:"view"})}}}),o("0",["1","2","3"],function(e,t,n){return e.add("preview",function(e){t.register(e),n.register(e)}),function(){}}),i("0")()}();