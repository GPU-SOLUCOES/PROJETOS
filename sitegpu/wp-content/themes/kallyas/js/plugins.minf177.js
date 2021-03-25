!function(e){var t,n,i=e.event;t=i.special.debouncedresize={setup:function(){e(this).on("resize",t.handler)},teardown:function(){e(this).off("resize",t.handler)},handler:function(e,o){var r=this,a=arguments,s=function(){e.type="debouncedresize",i.dispatch.apply(r,a)};n&&clearTimeout(n),o?s():n=setTimeout(s,t.threshold)},threshold:150}}(jQuery),function(e,t){"function"==typeof define&&define.amd?define(function(){return t(e)}):"object"==typeof exports?module.exports=t:e.echo=t(e)}(this,function(e){"use strict";var t,n,i,o,r,a={},s=function(){},c=function(e){return null===e.offsetParent},u=function(e,t){if(c(e))return!1;var n=e.getBoundingClientRect();return n.right>=t.l&&n.bottom>=t.t&&n.left<=t.r&&n.top<=t.b},l=function(){!o&&n||(clearTimeout(n),n=setTimeout(function(){a.render(),n=null},i))};return a.init=function(n){n=n||{};var c=n.offset||0,u=n.offsetVertical||c,d=n.offsetHorizontal||c,f=function(e,t){return parseInt(e||t,10)};t={t:f(n.offsetTop,u),b:f(n.offsetBottom,u),l:f(n.offsetLeft,d),r:f(n.offsetRight,d)},i=f(n.throttle,250),o=!1!==n.debounce,r=!!n.unload,s=n.callback||s,a.render(),document.addEventListener?(e.addEventListener("scroll",l,!1),e.addEventListener("load",l,!1)):(e.attachEvent("onscroll",l),e.attachEvent("onload",l))},a.render=function(n){for(var i,o,c=(n||document).querySelectorAll("[data-echo], [data-echo-background]"),l=c.length,d={l:0-t.l,t:0-t.t,b:(e.innerHeight||document.documentElement.clientHeight)+t.b,r:(e.innerWidth||document.documentElement.clientWidth)+t.r},f=0;f<l;f++)o=c[f],u(o,d)?(r&&o.setAttribute("data-echo-placeholder",o.src),null!==o.getAttribute("data-echo-background")?o.style.backgroundImage="url("+o.getAttribute("data-echo-background")+")":o.src!==(i=o.getAttribute("data-echo"))&&(o.src=i),r||(o.removeAttribute("data-echo"),o.removeAttribute("data-echo-background")),s(o,"load")):r&&(i=o.getAttribute("data-echo-placeholder"))&&(null!==o.getAttribute("data-echo-background")?o.style.backgroundImage="url("+i+")":o.src=i,o.removeAttribute("data-echo-placeholder"),s(o,"unload"));l||a.detach()},a.detach=function(){document.removeEventListener?e.removeEventListener("scroll",l):e.detachEvent("onscroll",l),clearTimeout(n)},a}),function(e){"use strict";e.fn.fitVids=function(t){var n={customSelector:null,ignore:null};if(!document.getElementById("fit-vids-style")){var i=document.head||document.getElementsByTagName("head")[0],o=document.createElement("div");o.innerHTML='<p>x</p><style id="fit-vids-style">.fluid-width-video-wrapper{width:100%;position:relative;padding:0;}.fluid-width-video-wrapper iframe,.fluid-width-video-wrapper object,.fluid-width-video-wrapper embed {position:absolute;top:0;left:0;width:100%;height:100%;}</style>',i.appendChild(o.childNodes[1])}return t&&e.extend(n,t),this.each(function(){var t=['iframe[src*="player.vimeo.com"]','iframe[src*="youtube.com"]','iframe[src*="youtube-nocookie.com"]','iframe[src*="kickstarter.com"][src*="video.html"]',"object","embed"];n.customSelector&&t.push(n.customSelector);var i=".fitvidsignore";n.ignore&&(i=i+", "+n.ignore);var o=e(this).find(t.join(","));o=o.not("object object"),o=o.not(i),o.each(function(t){var n=e(this);if(!(n.parents(i).length>0||"embed"===this.tagName.toLowerCase()&&n.parent("object").length||n.parent(".fluid-width-video-wrapper").length)){n.css("height")||n.css("width")||!isNaN(n.attr("height"))&&!isNaN(n.attr("width"))||(n.attr("height",9),n.attr("width",16));var o="object"===this.tagName.toLowerCase()||n.attr("height")&&!isNaN(parseInt(n.attr("height"),10))?parseInt(n.attr("height"),10):n.height(),r=isNaN(parseInt(n.attr("width"),10))?n.width():parseInt(n.attr("width"),10),a=o/r;if(!n.attr("id")){var s="fitvid"+t;n.attr("id",s)}n.wrap('<div class="fluid-width-video-wrapper"></div>').parent(".fluid-width-video-wrapper").css("padding-top",100*a+"%"),n.removeAttr("height").removeAttr("width")}})})}}(window.jQuery||window.Zepto),function(e,t){"function"==typeof define&&define.amd?define("ev-emitter/ev-emitter",t):"object"==typeof module&&module.exports?module.exports=t():e.EvEmitter=t()}("undefined"!=typeof window?window:this,function(){function e(){}var t=e.prototype;return t.on=function(e,t){if(e&&t){var n=this._events=this._events||{},i=n[e]=n[e]||[];return-1==i.indexOf(t)&&i.push(t),this}},t.once=function(e,t){if(e&&t){this.on(e,t);var n=this._onceEvents=this._onceEvents||{};return(n[e]=n[e]||{})[t]=!0,this}},t.off=function(e,t){var n=this._events&&this._events[e];if(n&&n.length){var i=n.indexOf(t);return-1!=i&&n.splice(i,1),this}},t.emitEvent=function(e,t){var n=this._events&&this._events[e];if(n&&n.length){var i=0,o=n[i];t=t||[];for(var r=this._onceEvents&&this._onceEvents[e];o;){var a=r&&r[o];a&&(this.off(e,o),delete r[o]),o.apply(this,t),i+=a?0:1,o=n[i]}return this}},e}),function(e,t){"use strict";"function"==typeof define&&define.amd?define(["ev-emitter/ev-emitter"],function(n){return t(e,n)}):"object"==typeof module&&module.exports?module.exports=t(e,require("ev-emitter")):e.imagesLoaded=t(e,e.EvEmitter)}(window,function(e,t){function n(e,t){for(var n in t)e[n]=t[n];return e}function i(e){var t=[];if(Array.isArray(e))t=e;else if("number"==typeof e.length)for(var n=0;n<e.length;n++)t.push(e[n]);else t.push(e);return t}function o(e,t,r){return this instanceof o?("string"==typeof e&&(e=document.querySelectorAll(e)),this.elements=i(e),this.options=n({},this.options),"function"==typeof t?r=t:n(this.options,t),r&&this.on("always",r),this.getImages(),s&&(this.jqDeferred=new s.Deferred),void setTimeout(function(){this.check()}.bind(this))):new o(e,t,r)}function r(e){this.img=e}function a(e,t){this.url=e,this.element=t,this.img=new Image}var s=e.jQuery,c=e.console;o.prototype=Object.create(t.prototype),o.prototype.options={},o.prototype.getImages=function(){this.images=[],this.elements.forEach(this.addElementImages,this)},o.prototype.addElementImages=function(e){"IMG"==e.nodeName&&this.addImage(e),!0===this.options.background&&this.addElementBackgroundImages(e);var t=e.nodeType;if(t&&u[t]){for(var n=e.querySelectorAll("img"),i=0;i<n.length;i++){var o=n[i];this.addImage(o)}if("string"==typeof this.options.background){var r=e.querySelectorAll(this.options.background);for(i=0;i<r.length;i++){var a=r[i];this.addElementBackgroundImages(a)}}}};var u={1:!0,9:!0,11:!0};return o.prototype.addElementBackgroundImages=function(e){var t=getComputedStyle(e);if(t)for(var n=/url\((['"])?(.*?)\1\)/gi,i=n.exec(t.backgroundImage);null!==i;){var o=i&&i[2];o&&this.addBackground(o,e),i=n.exec(t.backgroundImage)}},o.prototype.addImage=function(e){var t=new r(e);this.images.push(t)},o.prototype.addBackground=function(e,t){var n=new a(e,t);this.images.push(n)},o.prototype.check=function(){function e(e,n,i){setTimeout(function(){t.progress(e,n,i)})}var t=this;return this.progressedCount=0,this.hasAnyBroken=!1,this.images.length?void this.images.forEach(function(t){t.once("progress",e),t.check()}):void this.complete()},o.prototype.progress=function(e,t,n){this.progressedCount++,this.hasAnyBroken=this.hasAnyBroken||!e.isLoaded,this.emitEvent("progress",[this,e,t]),this.jqDeferred&&this.jqDeferred.notify&&this.jqDeferred.notify(this,e),this.progressedCount==this.images.length&&this.complete(),this.options.debug&&c&&c.log("progress: "+n,e,t)},o.prototype.complete=function(){var e=this.hasAnyBroken?"fail":"done";if(this.isComplete=!0,this.emitEvent(e,[this]),this.emitEvent("always",[this]),this.jqDeferred){var t=this.hasAnyBroken?"reject":"resolve";this.jqDeferred[t](this)}},r.prototype=Object.create(t.prototype),r.prototype.check=function(){return this.getIsImageComplete()?void this.confirm(0!==this.img.naturalWidth,"naturalWidth"):(this.proxyImage=new Image,this.proxyImage.addEventListener("load",this),this.proxyImage.addEventListener("error",this),this.img.addEventListener("load",this),this.img.addEventListener("error",this),void(this.proxyImage.src=this.img.src))},r.prototype.getIsImageComplete=function(){return this.img.complete&&void 0!==this.img.naturalWidth},r.prototype.confirm=function(e,t){this.isLoaded=e,this.emitEvent("progress",[this,this.img,t])},r.prototype.handleEvent=function(e){var t="on"+e.type;this[t]&&this[t](e)},r.prototype.onload=function(){this.confirm(!0,"onload"),this.unbindEvents()},r.prototype.onerror=function(){this.confirm(!1,"onerror"),this.unbindEvents()},r.prototype.unbindEvents=function(){this.proxyImage.removeEventListener("load",this),this.proxyImage.removeEventListener("error",this),this.img.removeEventListener("load",this),this.img.removeEventListener("error",this)},a.prototype=Object.create(r.prototype),a.prototype.check=function(){this.img.addEventListener("load",this),this.img.addEventListener("error",this),this.img.src=this.url,this.getIsImageComplete()&&(this.confirm(0!==this.img.naturalWidth,"naturalWidth"),this.unbindEvents())},a.prototype.unbindEvents=function(){this.img.removeEventListener("load",this),this.img.removeEventListener("error",this)},a.prototype.confirm=function(e,t){this.isLoaded=e,this.emitEvent("progress",[this,this.element,t])},o.makeJQueryPlugin=function(t){(t=t||e.jQuery)&&(s=t,s.fn.imagesLoaded=function(e,t){return new o(this,e,t).jqDeferred.promise(s(this))})},o.makeJQueryPlugin(),o}),jQuery.easing.jswing=jQuery.easing.swing,jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(e,t,n,i,o){return jQuery.easing[jQuery.easing.def](e,t,n,i,o)},easeInQuad:function(e,t,n,i,o){return i*(t/=o)*t+n},easeOutQuad:function(e,t,n,i,o){return-i*(t/=o)*(t-2)+n},easeInOutQuad:function(e,t,n,i,o){return(t/=o/2)<1?i/2*t*t+n:-i/2*(--t*(t-2)-1)+n},easeInCubic:function(e,t,n,i,o){return i*(t/=o)*t*t+n},easeOutCubic:function(e,t,n,i,o){return i*((t=t/o-1)*t*t+1)+n},easeInOutCubic:function(e,t,n,i,o){return(t/=o/2)<1?i/2*t*t*t+n:i/2*((t-=2)*t*t+2)+n},easeInQuart:function(e,t,n,i,o){return i*(t/=o)*t*t*t+n},easeOutQuart:function(e,t,n,i,o){return-i*((t=t/o-1)*t*t*t-1)+n},easeInOutQuart:function(e,t,n,i,o){return(t/=o/2)<1?i/2*t*t*t*t+n:-i/2*((t-=2)*t*t*t-2)+n},easeInQuint:function(e,t,n,i,o){return i*(t/=o)*t*t*t*t+n},easeOutQuint:function(e,t,n,i,o){return i*((t=t/o-1)*t*t*t*t+1)+n},easeInOutQuint:function(e,t,n,i,o){return(t/=o/2)<1?i/2*t*t*t*t*t+n:i/2*((t-=2)*t*t*t*t+2)+n},easeInSine:function(e,t,n,i,o){return-i*Math.cos(t/o*(Math.PI/2))+i+n},easeOutSine:function(e,t,n,i,o){return i*Math.sin(t/o*(Math.PI/2))+n},easeInOutSine:function(e,t,n,i,o){return-i/2*(Math.cos(Math.PI*t/o)-1)+n},easeInExpo:function(e,t,n,i,o){return 0==t?n:i*Math.pow(2,10*(t/o-1))+n},easeOutExpo:function(e,t,n,i,o){return t==o?n+i:i*(1-Math.pow(2,-10*t/o))+n},easeInOutExpo:function(e,t,n,i,o){return 0==t?n:t==o?n+i:(t/=o/2)<1?i/2*Math.pow(2,10*(t-1))+n:i/2*(2-Math.pow(2,-10*--t))+n},easeInCirc:function(e,t,n,i,o){return-i*(Math.sqrt(1-(t/=o)*t)-1)+n},easeOutCirc:function(e,t,n,i,o){return i*Math.sqrt(1-(t=t/o-1)*t)+n},easeInOutCirc:function(e,t,n,i,o){return(t/=o/2)<1?-i/2*(Math.sqrt(1-t*t)-1)+n:i/2*(Math.sqrt(1-(t-=2)*t)+1)+n},easeInElastic:function(e,t,n,i,o){var r=1.70158,a=0,s=i;if(0==t)return n;if(1==(t/=o))return n+i;if(a||(a=.3*o),s<Math.abs(i)){s=i;var r=a/4}else var r=a/(2*Math.PI)*Math.asin(i/s);return-s*Math.pow(2,10*(t-=1))*Math.sin((t*o-r)*(2*Math.PI)/a)+n},easeOutElastic:function(e,t,n,i,o){var r=1.70158,a=0,s=i;if(0==t)return n;if(1==(t/=o))return n+i;if(a||(a=.3*o),s<Math.abs(i)){s=i;var r=a/4}else var r=a/(2*Math.PI)*Math.asin(i/s);return s*Math.pow(2,-10*t)*Math.sin((t*o-r)*(2*Math.PI)/a)+i+n},easeInOutElastic:function(e,t,n,i,o){var r=1.70158,a=0,s=i;if(0==t)return n;if(2==(t/=o/2))return n+i;if(a||(a=o*(.3*1.5)),s<Math.abs(i)){s=i;var r=a/4}else var r=a/(2*Math.PI)*Math.asin(i/s);return t<1?s*Math.pow(2,10*(t-=1))*Math.sin((t*o-r)*(2*Math.PI)/a)*-.5+n:s*Math.pow(2,-10*(t-=1))*Math.sin((t*o-r)*(2*Math.PI)/a)*.5+i+n},easeInBack:function(e,t,n,i,o,r){return void 0==r&&(r=1.70158),i*(t/=o)*t*((r+1)*t-r)+n},easeOutBack:function(e,t,n,i,o,r){return void 0==r&&(r=1.70158),i*((t=t/o-1)*t*((r+1)*t+r)+1)+n},easeInOutBack:function(e,t,n,i,o,r){return void 0==r&&(r=1.70158),(t/=o/2)<1?i/2*(t*t*((1+(r*=1.525))*t-r))+n:i/2*((t-=2)*t*((1+(r*=1.525))*t+r)+2)+n},easeInBounce:function(e,t,n,i,o){return i-jQuery.easing.easeOutBounce(e,o-t,0,i,o)+n},easeOutBounce:function(e,t,n,i,o){return(t/=o)<1/2.75?i*(7.5625*t*t)+n:t<2/2.75?i*(7.5625*(t-=1.5/2.75)*t+.75)+n:t<2.5/2.75?i*(7.5625*(t-=2.25/2.75)*t+.9375)+n:i*(7.5625*(t-=2.625/2.75)*t+.984375)+n},easeInOutBounce:function(e,t,n,i,o){return t<o/2?.5*jQuery.easing.easeInBounce(e,2*t,0,i,o)+n:.5*jQuery.easing.easeOutBounce(e,2*t-o,0,i,o)+.5*i+n}}),function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e("object"==typeof exports?require("jquery"):window.jQuery||window.Zepto)}(function(e){var t,n,i,o,r,a,s="Close",c="BeforeClose",u="MarkupParse",l="Open",d="Change",f="mfp",p="."+f,m="mfp-ready",h="mfp-removing",g="mfp-prevent-close",v=function(){},y=!!window.jQuery,b=e(window),w=function(e,n){t.ev.on(f+e+p,n)},I=function(t,n,i,o){var r=document.createElement("div");return r.className="mfp-"+t,i&&(r.innerHTML=i),o?n&&n.appendChild(r):(r=e(r),n&&r.appendTo(n)),r},C=function(n,i){t.ev.triggerHandler(f+n,i),t.st.callbacks&&(n=n.charAt(0).toLowerCase()+n.slice(1),t.st.callbacks[n]&&t.st.callbacks[n].apply(t,e.isArray(i)?i:[i]))},E=function(n){return n===a&&t.currTemplate.closeBtn||(t.currTemplate.closeBtn=e(t.st.closeMarkup.replace("%title%",t.st.tClose)),a=n),t.currTemplate.closeBtn},k=function(){e.magnificPopup.instance||(t=new v,t.init(),e.magnificPopup.instance=t)},x=function(){var e=document.createElement("p").style,t=["ms","O","Moz","Webkit"];if(void 0!==e.transition)return!0;for(;t.length;)if(t.pop()+"Transition"in e)return!0;return!1};v.prototype={constructor:v,init:function(){var n=navigator.appVersion;t.isIE7=-1!==n.indexOf("MSIE 7."),t.isIE8=-1!==n.indexOf("MSIE 8."),t.isLowIE=t.isIE7||t.isIE8,t.isAndroid=/android/gi.test(n),t.isIOS=/iphone|ipad|ipod/gi.test(n),t.supportsTransition=x(),t.probablyMobile=t.isAndroid||t.isIOS||/(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent),i=e(document),t.popupsCache={}},open:function(n){var o;if(!1===n.isObj){t.items=n.items.toArray(),t.index=0;var a,s=n.items;for(o=0;o<s.length;o++)if(a=s[o],a.parsed&&(a=a.el[0]),a===n.el[0]){t.index=o;break}}else t.items=e.isArray(n.items)?n.items:[n.items],t.index=n.index||0;if(t.isOpen)return void t.updateItemHTML();t.types=[],r="",n.mainEl&&n.mainEl.length?t.ev=n.mainEl.eq(0):t.ev=i,n.key?(t.popupsCache[n.key]||(t.popupsCache[n.key]={}),t.currTemplate=t.popupsCache[n.key]):t.currTemplate={},t.st=e.extend(!0,{},e.magnificPopup.defaults,n),t.fixedContentPos="auto"===t.st.fixedContentPos?!t.probablyMobile:t.st.fixedContentPos,t.st.modal&&(t.st.closeOnContentClick=!1,t.st.closeOnBgClick=!1,t.st.showCloseBtn=!1,t.st.enableEscapeKey=!1),t.bgOverlay||(t.bgOverlay=I("bg").on("click"+p,function(){t.close()}),t.wrap=I("wrap").attr("tabindex",-1).on("click"+p,function(e){t._checkIfClose(e.target)&&t.close()}),t.container=I("container",t.wrap)),t.contentContainer=I("content"),t.st.preloader&&(t.preloader=I("preloader",t.container,t.st.tLoading));var c=e.magnificPopup.modules;for(o=0;o<c.length;o++){var d=c[o];d=d.charAt(0).toUpperCase()+d.slice(1),t["init"+d].call(t)}C("BeforeOpen"),t.st.showCloseBtn&&(t.st.closeBtnInside?(w(u,function(e,t,n,i){n.close_replaceWith=E(i.type)}),r+=" mfp-close-btn-in"):t.wrap.append(E())),t.st.alignTop&&(r+=" mfp-align-top"),t.fixedContentPos?t.wrap.css({overflow:t.st.overflowY,overflowX:"hidden",overflowY:t.st.overflowY}):t.wrap.css({top:b.scrollTop(),position:"absolute"}),(!1===t.st.fixedBgPos||"auto"===t.st.fixedBgPos&&!t.fixedContentPos)&&t.bgOverlay.css({height:i.height(),position:"absolute"}),t.st.enableEscapeKey&&i.on("keyup"+p,function(e){27===e.keyCode&&t.close()}),b.on("resize"+p,function(){t.updateSize()}),t.st.closeOnContentClick||(r+=" mfp-auto-cursor"),r&&t.wrap.addClass(r);var f=t.wH=b.height(),h={};if(t.fixedContentPos&&t._hasScrollBar(f)){var g=t._getScrollbarSize();g&&(h.marginRight=g)}t.fixedContentPos&&(t.isIE7?e("body, html").css("overflow","hidden"):h.overflow="hidden");var v=t.st.mainClass;return t.isIE7&&(v+=" mfp-ie7"),v&&t._addClassToMFP(v),t.updateItemHTML(),C("BuildControls"),e("html").css(h),t.bgOverlay.add(t.wrap).prependTo(t.st.prependTo||e(document.body)),t._lastFocusedEl=document.activeElement,setTimeout(function(){t.content?(t._addClassToMFP(m),t._setFocus()):t.bgOverlay.addClass(m),i.on("focusin"+p,t._onFocusIn)},16),t.isOpen=!0,t.updateSize(f),C(l),n},close:function(){t.isOpen&&(C(c),t.isOpen=!1,t.st.removalDelay&&!t.isLowIE&&t.supportsTransition?(t._addClassToMFP(h),setTimeout(function(){t._close()},t.st.removalDelay)):t._close())},_close:function(){C(s);var n=h+" "+m+" ";if(t.bgOverlay.detach(),t.wrap.detach(),t.container.empty(),t.st.mainClass&&(n+=t.st.mainClass+" "),t._removeClassFromMFP(n),t.fixedContentPos){var o={marginRight:""};t.isIE7?e("body, html").css("overflow",""):o.overflow="",e("html").css(o)}i.off("keyup.mfp focusin"+p),t.ev.off(p),t.wrap.attr("class","mfp-wrap").removeAttr("style"),t.bgOverlay.attr("class","mfp-bg"),t.container.attr("class","mfp-container"),!t.st.showCloseBtn||t.st.closeBtnInside&&!0!==t.currTemplate[t.currItem.type]||t.currTemplate.closeBtn&&t.currTemplate.closeBtn.detach(),t.st.autoFocusLast&&t._lastFocusedEl&&e(t._lastFocusedEl).focus(),t.currItem=null,t.content=null,t.currTemplate=null,t.prevHeight=0,C("AfterClose")},updateSize:function(e){if(t.isIOS){var n=document.documentElement.clientWidth/window.innerWidth,i=window.innerHeight*n;t.wrap.css("height",i),t.wH=i}else t.wH=e||b.height();t.fixedContentPos||t.wrap.css("height",t.wH),C("Resize")},updateItemHTML:function(){var n=t.items[t.index];t.contentContainer.detach(),t.content&&t.content.detach(),n.parsed||(n=t.parseEl(t.index));var i=n.type;if(C("BeforeChange",[t.currItem?t.currItem.type:"",i]),t.currItem=n,!t.currTemplate[i]){var r=!!t.st[i]&&t.st[i].markup;C("FirstMarkupParse",r),t.currTemplate[i]=!r||e(r)}o&&o!==n.type&&t.container.removeClass("mfp-"+o+"-holder");var a=t["get"+i.charAt(0).toUpperCase()+i.slice(1)](n,t.currTemplate[i]);t.appendContent(a,i),n.preloaded=!0,C(d,n),o=n.type,t.container.prepend(t.contentContainer),C("AfterChange")},appendContent:function(e,n){t.content=e,e?t.st.showCloseBtn&&t.st.closeBtnInside&&!0===t.currTemplate[n]?t.content.find(".mfp-close").length||t.content.append(E()):t.content=e:t.content="",C("BeforeAppend"),t.container.addClass("mfp-"+n+"-holder"),t.contentContainer.append(t.content)},parseEl:function(n){var i,o=t.items[n];if(o.tagName?o={el:e(o)}:(i=o.type,o={data:o,src:o.src}),o.el){for(var r=t.types,a=0;a<r.length;a++)if(o.el.hasClass("mfp-"+r[a])){i=r[a];break}o.src=o.el.attr("data-mfp-src"),o.src||(o.src=o.el.attr("href"))}return o.type=i||t.st.type||"inline",o.index=n,o.parsed=!0,t.items[n]=o,C("ElementParse",o),t.items[n]},addGroup:function(e,n){var i=function(i){i.mfpEl=this,t._openClick(i,e,n)};n||(n={});var o="click.magnificPopup";n.mainEl=e,n.items?(n.isObj=!0,e.off(o).on(o,i)):(n.isObj=!1,n.delegate?e.off(o).on(o,n.delegate,i):(n.items=e,e.off(o).on(o,i)))},_openClick:function(n,i,o){if((void 0!==o.midClick?o.midClick:e.magnificPopup.defaults.midClick)||!(2===n.which||n.ctrlKey||n.metaKey||n.altKey||n.shiftKey)){var r=void 0!==o.disableOn?o.disableOn:e.magnificPopup.defaults.disableOn;if(r)if(e.isFunction(r)){if(!r.call(t))return!0}else if(b.width()<r)return!0;n.type&&(n.preventDefault(),t.isOpen&&n.stopPropagation()),o.el=e(n.mfpEl),o.delegate&&(o.items=i.find(o.delegate)),t.open(o)}},updateStatus:function(e,i){if(t.preloader){n!==e&&t.container.removeClass("mfp-s-"+n),i||"loading"!==e||(i=t.st.tLoading);var o={status:e,text:i};C("UpdateStatus",o),e=o.status,i=o.text,t.preloader.html(i),t.preloader.find("a").on("click",function(e){e.stopImmediatePropagation()}),t.container.addClass("mfp-s-"+e),n=e}},_checkIfClose:function(n){if(!e(n).hasClass(g)){var i=t.st.closeOnContentClick,o=t.st.closeOnBgClick;if(i&&o)return!0;if(!t.content||e(n).hasClass("mfp-close")||t.preloader&&n===t.preloader[0])return!0;if(n===t.content[0]||e.contains(t.content[0],n)){if(i)return!0}else if(o&&e.contains(document,n))return!0;return!1}},_addClassToMFP:function(e){t.bgOverlay.addClass(e),t.wrap.addClass(e)},_removeClassFromMFP:function(e){this.bgOverlay.removeClass(e),t.wrap.removeClass(e)},_hasScrollBar:function(e){return(t.isIE7?i.height():document.body.scrollHeight)>(e||b.height())},_setFocus:function(){(t.st.focus?t.content.find(t.st.focus).eq(0):t.wrap).focus()},_onFocusIn:function(n){return n.target===t.wrap[0]||e.contains(t.wrap[0],n.target)?void 0:(t._setFocus(),!1)},_parseMarkup:function(t,n,i){var o;i.data&&(n=e.extend(i.data,n)),C(u,[t,n,i]),e.each(n,function(e,n){if(void 0===n||!1===n)return!0;if(o=e.split("_"),o.length>1){var i=t.find(p+"-"+o[0]);if(i.length>0){var r=o[1];"replaceWith"===r?i[0]!==n[0]&&i.replaceWith(n):"img"===r?i.is("img")?i.attr("src",n):i.replaceWith('<img src="'+n+'" class="'+i.attr("class")+'" />'):i.attr(o[1],n)}}else t.find(p+"-"+e).html(n)})},_getScrollbarSize:function(){if(void 0===t.scrollbarSize){var e=document.createElement("div");e.style.cssText="width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;",document.body.appendChild(e),t.scrollbarSize=e.offsetWidth-e.clientWidth,document.body.removeChild(e)}return t.scrollbarSize}},e.magnificPopup={instance:null,proto:v.prototype,modules:[],open:function(t,n){return k(),t=t?e.extend(!0,{},t):{},t.isObj=!0,t.index=n||0,this.instance.open(t)},close:function(){return e.magnificPopup.instance&&e.magnificPopup.instance.close()},registerModule:function(t,n){n.options&&(e.magnificPopup.defaults[t]=n.options),e.extend(this.proto,n.proto),this.modules.push(t)},defaults:{disableOn:0,key:null,midClick:!1,mainClass:"",preloader:!0,focus:"",closeOnContentClick:!1,closeOnBgClick:!0,closeBtnInside:!0,showCloseBtn:!0,enableEscapeKey:!0,modal:!1,alignTop:!1,removalDelay:0,prependTo:null,fixedContentPos:"auto",fixedBgPos:"auto",overflowY:"auto",closeMarkup:'<button title="%title%" type="button" class="mfp-close">&#215;</button>',tClose:"Close (Esc)",tLoading:"Loading...",autoFocusLast:!0}},e.fn.magnificPopup=function(n){k();var i=e(this);if("string"==typeof n)if("open"===n){var o,r=y?i.data("magnificPopup"):i[0].magnificPopup,a=parseInt(arguments[1],10)||0;r.items?o=r.items[a]:(o=i,r.delegate&&(o=o.find(r.delegate)),o=o.eq(a)),t._openClick({mfpEl:o},i,r)}else t.isOpen&&t[n].apply(t,Array.prototype.slice.call(arguments,1));else n=e.extend(!0,{},n),y?i.data("magnificPopup",n):i[0].magnificPopup=n,t.addGroup(i,n);return i};var M,O,T,_="inline",P=function(){T&&(O.after(T.addClass(M)).detach(),T=null)};e.magnificPopup.registerModule(_,{options:{hiddenClass:"hide",markup:"",tNotFound:"Content not found"},proto:{initInline:function(){t.types.push(_),w(s+"."+_,function(){P()})},getInline:function(n,i){if(P(),n.src){var o=t.st.inline,r=e(n.src);if(r.length){var a=r[0].parentNode;a&&a.tagName&&(O||(M=o.hiddenClass,O=I(M),M="mfp-"+M),T=r.after(O).detach().removeClass(M)),t.updateStatus("ready")}else t.updateStatus("error",o.tNotFound),r=e("<div>");return n.inlineElement=r,r}return t.updateStatus("ready"),t._parseMarkup(i,{},n),i}}});var S,B="ajax",L=function(){S&&e(document.body).removeClass(S)},j=function(){L(),t.req&&t.req.abort()};e.magnificPopup.registerModule(B,{options:{settings:null,cursor:"mfp-ajax-cur",tError:'<a href="%url%">The content</a> could not be loaded.'},proto:{initAjax:function(){t.types.push(B),S=t.st.ajax.cursor,w(s+"."+B,j),w("BeforeChange."+B,j)},getAjax:function(n){S&&e(document.body).addClass(S),t.updateStatus("loading");var i=e.extend({url:n.src,success:function(i,o,r){var a={data:i,xhr:r};C("ParseAjax",a),t.appendContent(e(a.data),B),n.finished=!0,L(),t._setFocus(),setTimeout(function(){t.wrap.addClass(m)},16),t.updateStatus("ready"),C("AjaxContentAdded")},error:function(){L(),n.finished=n.loadError=!0,t.updateStatus("error",t.st.ajax.tError.replace("%url%",n.src))}},t.st.ajax.settings);return t.req=e.ajax(i),""}}});var z,A=function(n){if(n.data&&void 0!==n.data.title)return n.data.title;var i=t.st.image.titleSrc;if(i){if(e.isFunction(i))return i.call(t,n);if(n.el)return n.el.attr(i)||""}return""};e.magnificPopup.registerModule("image",{options:{markup:'<div class="mfp-figure"><div class="mfp-close"></div><figure><div class="mfp-img"></div><figcaption><div class="mfp-bottom-bar"><div class="mfp-title"></div><div class="mfp-counter"></div></div></figcaption></figure></div>',cursor:"mfp-zoom-out-cur",titleSrc:"title",verticalFit:!0,tError:'<a href="%url%">The image</a> could not be loaded.'},proto:{initImage:function(){var n=t.st.image,i=".image";t.types.push("image"),w(l+i,function(){"image"===t.currItem.type&&n.cursor&&e(document.body).addClass(n.cursor)}),w(s+i,function(){n.cursor&&e(document.body).removeClass(n.cursor),b.off("resize"+p)}),w("Resize"+i,t.resizeImage),t.isLowIE&&w("AfterChange",t.resizeImage)},resizeImage:function(){var e=t.currItem;if(e&&e.img&&t.st.image.verticalFit){var n=0;t.isLowIE&&(n=parseInt(e.img.css("padding-top"),10)+parseInt(e.img.css("padding-bottom"),10)),e.img.css("max-height",t.wH-n)}},_onImageHasSize:function(e){e.img&&(e.hasSize=!0,z&&clearInterval(z),e.isCheckingImgSize=!1,C("ImageHasSize",e),e.imgHidden&&(t.content&&t.content.removeClass("mfp-loading"),e.imgHidden=!1))},findImageSize:function(e){var n=0,i=e.img[0],o=function(r){z&&clearInterval(z),z=setInterval(function(){return i.naturalWidth>0?void t._onImageHasSize(e):(n>200&&clearInterval(z),n++,void(3===n?o(10):40===n?o(50):100===n&&o(500)))},r)};o(1)},getImage:function(n,i){var o=0,r=function(){n&&(n.img[0].complete?(n.img.off(".mfploader"),n===t.currItem&&(t._onImageHasSize(n),t.updateStatus("ready")),n.hasSize=!0,n.loaded=!0,C("ImageLoadComplete")):(o++,200>o?setTimeout(r,100):a()))},a=function(){n&&(n.img.off(".mfploader"),n===t.currItem&&(t._onImageHasSize(n),t.updateStatus("error",s.tError.replace("%url%",n.src))),n.hasSize=!0,n.loaded=!0,n.loadError=!0)},s=t.st.image,c=i.find(".mfp-img");if(c.length){var u=document.createElement("img");u.className="mfp-img",n.el&&n.el.find("img").length&&(u.alt=n.el.find("img").attr("alt")),n.img=e(u).on("load.mfploader",r).on("error.mfploader",a),u.src=n.src,c.is("img")&&(n.img=n.img.clone()),u=n.img[0],u.naturalWidth>0?n.hasSize=!0:u.width||(n.hasSize=!1)}return t._parseMarkup(i,{title:A(n),img_replaceWith:n.img},n),t.resizeImage(),n.hasSize?(z&&clearInterval(z),n.loadError?(i.addClass("mfp-loading"),t.updateStatus("error",s.tError.replace("%url%",n.src))):(i.removeClass("mfp-loading"),t.updateStatus("ready")),i):(t.updateStatus("loading"),n.loading=!0,n.hasSize||(n.imgHidden=!0,i.addClass("mfp-loading"),t.findImageSize(n)),i)}}});var F,H=function(){return void 0===F&&(F=void 0!==document.createElement("p").style.MozTransform),F};e.magnificPopup.registerModule("zoom",{options:{enabled:!1,easing:"ease-in-out",duration:300,opener:function(e){return e.is("img")?e:e.find("img")}},proto:{initZoom:function(){var e,n=t.st.zoom,i=".zoom";if(n.enabled&&t.supportsTransition){var o,r,a=n.duration,u=function(e){var t=e.clone().removeAttr("style").removeAttr("class").addClass("mfp-animated-image"),i="all "+n.duration/1e3+"s "+n.easing,o={position:"fixed",zIndex:9999,left:0,top:0,"-webkit-backface-visibility":"hidden"},r="transition";return o["-webkit-"+r]=o["-moz-"+r]=o["-o-"+r]=o[r]=i,t.css(o),t},l=function(){t.content.css("visibility","visible")};w("BuildControls"+i,function(){if(t._allowZoom()){if(clearTimeout(o),t.content.css("visibility","hidden"),!(e=t._getItemToZoom()))return void l();r=u(e),r.css(t._getOffset()),t.wrap.append(r),o=setTimeout(function(){r.css(t._getOffset(!0)),o=setTimeout(function(){l(),setTimeout(function(){r.remove(),e=r=null,C("ZoomAnimationEnded")},16)},a)},16)}}),w(c+i,function(){if(t._allowZoom()){if(clearTimeout(o),t.st.removalDelay=a,!e){if(!(e=t._getItemToZoom()))return;r=u(e)}r.css(t._getOffset(!0)),t.wrap.append(r),t.content.css("visibility","hidden"),setTimeout(function(){r.css(t._getOffset())},16)}}),w(s+i,function(){t._allowZoom()&&(l(),r&&r.remove(),e=null)})}},_allowZoom:function(){return"image"===t.currItem.type},_getItemToZoom:function(){return!!t.currItem.hasSize&&t.currItem.img},_getOffset:function(n){var i;i=n?t.currItem.img:t.st.zoom.opener(t.currItem.el||t.currItem);var o=i.offset(),r=parseInt(i.css("padding-top"),10),a=parseInt(i.css("padding-bottom"),10);o.top-=e(window).scrollTop()-r;var s={width:i.width(),height:(y?i.innerHeight():i[0].offsetHeight)-a-r};return H()?s["-moz-transform"]=s.transform="translate("+o.left+"px,"+o.top+"px)":(s.left=o.left,s.top=o.top),s}}});var N="iframe",Q=function(e){if(t.currTemplate[N]){var n=t.currTemplate[N].find("iframe");n.length&&(e||(n[0].src="//about:blank"),t.isIE8&&n.css("display",e?"block":"none"))}};e.magnificPopup.registerModule(N,{options:{markup:'<div class="mfp-iframe-scaler"><div class="mfp-close"></div><iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe></div>',srcAction:"iframe_src",patterns:{youtube:{index:"youtube.com",id:"v=",src:"//www.youtube.com/embed/%id%?autoplay=1"},vimeo:{index:"vimeo.com/",id:"/",src:"//player.vimeo.com/video/%id%?autoplay=1"},gmaps:{index:"//maps.google.",src:"%id%&output=embed"}}},proto:{initIframe:function(){t.types.push(N),w("BeforeChange",function(e,t,n){t!==n&&(t===N?Q():n===N&&Q(!0))}),w(s+"."+N,function(){Q()})},getIframe:function(n,i){var o=n.src,r=t.st.iframe;e.each(r.patterns,function(){return o.indexOf(this.index)>-1?(this.id&&(o="string"==typeof this.id?o.substr(o.lastIndexOf(this.id)+this.id.length,o.length):this.id.call(this,o)),o=this.src.replace("%id%",o),!1):void 0});var a={};return r.srcAction&&(a[r.srcAction]=o),t._parseMarkup(i,a,n),t.updateStatus("ready"),i}}});var q=function(e){var n=t.items.length;return e>n-1?e-n:0>e?n+e:e},W=function(e,t,n){return e.replace(/%curr%/gi,t+1).replace(/%total%/gi,n)};e.magnificPopup.registerModule("gallery",{options:{enabled:!1,arrowMarkup:'<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',preload:[0,2],navigateByImgClick:!0,arrows:!0,tPrev:"Previous (Left arrow key)",tNext:"Next (Right arrow key)",tCounter:"%curr% of %total%"},proto:{initGallery:function(){var n=t.st.gallery,o=".mfp-gallery",a=Boolean(e.fn.mfpFastClick);return t.direction=!0,!(!n||!n.enabled)&&(r+=" mfp-gallery",w(l+o,function(){n.navigateByImgClick&&t.wrap.on("click"+o,".mfp-img",function(){return t.items.length>1?(t.next(),!1):void 0}),i.on("keydown"+o,function(e){37===e.keyCode?t.prev():39===e.keyCode&&t.next()})}),w("UpdateStatus"+o,function(e,n){n.text&&(n.text=W(n.text,t.currItem.index,t.items.length))}),w(u+o,function(e,i,o,r){var a=t.items.length;o.counter=a>1?W(n.tCounter,r.index,a):""}),w("BuildControls"+o,function(){if(t.items.length>1&&n.arrows&&!t.arrowLeft){var i=n.arrowMarkup,o=t.arrowLeft=e(i.replace(/%title%/gi,n.tPrev).replace(/%dir%/gi,"left")).addClass(g),r=t.arrowRight=e(i.replace(/%title%/gi,n.tNext).replace(/%dir%/gi,"right")).addClass(g),s=a?"mfpFastClick":"click";o[s](function(){t.prev()}),r[s](function(){t.next()}),t.isIE7&&(I("b",o[0],!1,!0),I("a",o[0],!1,!0),I("b",r[0],!1,!0),I("a",r[0],!1,!0)),t.container.append(o.add(r))}}),w(d+o,function(){t._preloadTimeout&&clearTimeout(t._preloadTimeout),t._preloadTimeout=setTimeout(function(){t.preloadNearbyImages(),t._preloadTimeout=null},16)}),void w(s+o,function(){i.off(o),t.wrap.off("click"+o),t.arrowLeft&&a&&t.arrowLeft.add(t.arrowRight).destroyMfpFastClick(),t.arrowRight=t.arrowLeft=null}))},next:function(){t.direction=!0,t.index=q(t.index+1),t.updateItemHTML()},prev:function(){t.direction=!1,t.index=q(t.index-1),t.updateItemHTML()},goTo:function(e){t.direction=e>=t.index,t.index=e,t.updateItemHTML()},preloadNearbyImages:function(){var e,n=t.st.gallery.preload,i=Math.min(n[0],t.items.length),o=Math.min(n[1],t.items.length);for(e=1;e<=(t.direction?o:i);e++)t._preloadItem(t.index+e)
;for(e=1;e<=(t.direction?i:o);e++)t._preloadItem(t.index-e)},_preloadItem:function(n){if(n=q(n),!t.items[n].preloaded){var i=t.items[n];i.parsed||(i=t.parseEl(n)),C("LazyLoad",i),"image"===i.type&&(i.img=e('<img class="mfp-img" />').on("load.mfploader",function(){i.hasSize=!0}).on("error.mfploader",function(){i.hasSize=!0,i.loadError=!0,C("LazyLoadError",i)}).attr("src",i.src)),i.preloaded=!0}}}});var D="retina";e.magnificPopup.registerModule(D,{options:{replaceSrc:function(e){return e.src.replace(/\.\w+$/,function(e){return"@2x"+e})},ratio:1},proto:{initRetina:function(){if(window.devicePixelRatio>1){var e=t.st.retina,n=e.ratio;(n=isNaN(n)?n():n)>1&&(w("ImageHasSize."+D,function(e,t){t.img.css({"max-width":t.img[0].naturalWidth/n,width:"100%"})}),w("ElementParse."+D,functi�UH�U  �UH�U                  `��G�U          @��G�U  VH�U          �UH�U  8      �UH�U          chmove"+i+" touchend"+i)},i=".mfpFastClick";e.fn.mfpFastClick=function(o){return e(this).each(function(){var r,a=e(this);if(t){var s,c,u,l,d,f;a.on("touchstart"+i,function(e){l=!1,f=1,d=e.originalEvent?e.originalEvent.touches[0]:e.touches[0],c=d.clientX,u=d.clientY,b.on("touchmove"+i,function(e){d=e.originalEvent?e.originalEvent.touches:e.touches,f=d.length,d=d[0],(Math.abs(d.clientX-c)>10||Math.abs(d.clientY-u)>10)&&(l=!0,n())}).on("touchend"+i,function(e){n(),l||f>1||(r=!0,e.preventDefault(),clearTimeout(s),s=setTimeout(function(){r=!1},1e3),o())})})}a.on("click"+i,function(){r||o()})})},e.fn.destroyMfpFastClick=function(){e(this).off("touchstart"+i+" click"+i),t&&b.off("touchmove"+i+" touchend"+i)}}(),k()});