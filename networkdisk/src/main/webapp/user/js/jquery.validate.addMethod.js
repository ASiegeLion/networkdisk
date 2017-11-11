
$(document).ready(function(){
	jQuery.validator.addMethod("stringCheck", function(value, element) {
		return this.optional(element) ||/^[a-zA-Z\u4e00-\u9fa5]+$/.test(value);
		}, "只能包括中文和英文");
		// 中文字两个字节
		jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
		var length = value.length;
		for(var i = 0; i < value.length; i++){
		if(value.charCodeAt(i) > 127){
		length++;
		}
		}
		return this.optional(element) || ( length >= param[0]&&length <= param[1] );
		}, "用户名范围在3-15个字节之间(一个中文算2个字节)");
		
		jQuery.validator.addMethod("passwordLength", function(value, element, param) {
			var length = value.length;
			for(var i = 0; i < value.length; i++){
			if(value.charCodeAt(i) > 127){
			length++;
			}
			}
			return this.optional(element) || ( length >= param[0]&&length <= param[1] );
			}, "密码范围在6-12个字节之间");
		
		
		jQuery.validator.addMethod("isPwd", function(value, element) {
			return this.optional(element) ||/^(?![^a-zA-Z]+$)(?!\D+$)/.test(value);
			}, "必须包含英文字母和数字");
	

	jQuery.validator.addMethod("isMobile", function(value, element) {  
	    var length = value.length;  
	    var regPhone = /^1([3578]\d|4[57])\d{8}$/;  
	    return this.optional(element) || ( length == 11 && regPhone.test( value ) );    
	}, "请正确填写您的手机号码");  
	
	jQuery.validator.addMethod("isChar", function(value, element) {  
	    var length = value.length;  
	    var regName = /[^\u4e00-\u9fa5]/g;  
	    return this.optional(element) || !regName.test( value );    
	}, "请正确格式的姓名(暂支持汉字)");  
	
	jQuery.validator.addMethod("stringMaxLength", function(value,element, param) {
		var length = value.length;
		for ( var i = 0; i < value.length; i++) {
		if (value.charCodeAt(i) > 127) {
		length++;
		}
		}
		return this.optional(element) || (length <=param);
		}, $.validator.format("姓名最多只允许8个字符（一个中文占两个字符）!"));
	
	
});
