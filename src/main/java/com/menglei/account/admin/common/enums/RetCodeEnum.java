package com.menglei.account.admin.common.enums;

/**
  * Description 接口返回结果codeEnum
  * @author Menglei（lei.meng@cmgplex.com)
  * @date 15:07 2018/12/5
  **/
public enum RetCodeEnum {
    /**
     * 默认返回值，操作成功
     * */
    SUCCESS("8200", "成功"),

    /**
     * 以下是基础信息服务错误代码
     **/
    /**
     * 服务器内部错误
     * */
    UNKNOWN("8201", "服务器内部错误"),
    /**
     * 缺少必要的参数
     * */
    MISSING("8202", "缺少必要的参数"),
    /**
     * 未找到的数据
     * */
    NODATA("8203", "未发现该数据"),
    /**
     * 不便归类到的其他错误
     * */
    UNIFIED("8299", "不便归类的其他错误"),
    /**
     * 上游服务不可达
     */
    BADGATEWAY("8502","上游服务不可达")

    ;

    private String code;
    private String message;

    RetCodeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
