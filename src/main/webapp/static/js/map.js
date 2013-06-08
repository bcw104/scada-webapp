function Map() {
    this.keys = new Array();
    this.data = new Array();
    
    // 添加键值对
    this.set = function (key, value) {
        
        // 如键不存在则身【键】数组添加键名
        if (this.data[key] == null) {
            this.keys.push(key);
        }
        this.data[key] = value;//给键赋值
    };
    
    //获取键对应的值
    this.get = function (key) {
        return this.data[key];
    };
    
    //去除键值，(去除键数据中的键名及对应的值)
    this.remove = function (key) {
        this.keys.remove(key);
        this.data[key] = null;
    };
    
    //判断键值元素是否为空
    this.isEmpty = function () {
        return this.keys.length == 0;
    };
    
    //获取键值元素大小
    this.size = function () {
        return this.keys.length;
    };
}

