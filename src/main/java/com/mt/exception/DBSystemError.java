package com.mt.exception;

public class DBSystemError extends CustomException{

    public DBSystemError() {
        super("数据库错误，请重试");
    }

    public DBSystemError(String message) {
        super(message);
    }
}
