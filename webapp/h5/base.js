var StringUtil = {
	REGEX_MONEY : /(^[0-9]+$)|(^[0-9]+\.[0-9]{1,2}$)/g,
	isMoney : function(moneyStr) {
		if (!moneyStr) {
			return false;
		}
		return moneyStr.match(this.REGEX_MONEY);
	},
	isEmpty : function(str) {
		if (!str) {
			return true;
		}
		if (str.trim() == "") {
			return true;
		}
		return false;
	}
};