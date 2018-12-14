package com.menglei.account.admin.common;

import com.menglei.account.admin.common.enums.RetCodeEnum;

import java.io.Serializable;

/**
  * @className JsonResult
  * Description 接口统一返回的格式
  * @date 2018/12/5 15:01
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
public class JsonResult<T> implements Serializable {

    private static final long serialVersionUID = 568183640114277488L;
    private String code;
    private String message;
    private T data;

    public JsonResult(String code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public JsonResult(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public JsonResult(RetCodeEnum result, T data) {
        this.code = result.getCode();
        this.message = result.getMessage();
        this.data = data;
    }

    public JsonResult(RetCodeEnum result) {
        this.code = result.getCode();
        this.message = result.getMessage();
    }

    public JsonResult(T data) {
        this.code = RetCodeEnum.SUCCESS.getCode();
        this.message = RetCodeEnum.SUCCESS.getMessage();
        this.data = data;
    }

    public JsonResult() {
        this.code = RetCodeEnum.SUCCESS.getCode();
        this.message = RetCodeEnum.SUCCESS.getMessage();
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }

    /*
     * (非 Javadoc) <p>Title: toString</p> <p>Description: </p>
     *
     * @return
     *
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "JsonResult [code=" + this.code + ", message=" + this.message + ", data=" + this.data + "]";
    }
}
