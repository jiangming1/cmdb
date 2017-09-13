Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate() > 9 ? this.getDate() : "0" + this.getDate()) + " "
			+ (this.getHours() > 9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes()) + ":"
			+ (this.getSeconds() > 9 ? this.getSeconds() : "0" + this.getSeconds());
};

Date.prototype.toCNString2 = function() {
	return this.getFullYear()  + "" + (this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "" + (this.getDate() > 9 ? this.getDate() : "0" + this.getDate()) + ""
			+ (this.getHours() > 9 ? this.getHours() : "0" + this.getHours()) + "" + (this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes()) + ""
			+ (this.getSeconds() > 9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate() > 9 ? this.getDate() : "0" + this.getDate()) + " "
			+ (this.getHours() > 9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes());
};