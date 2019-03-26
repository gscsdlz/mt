package com.mt.exception;

import com.mt.enums.DBErrorType;

public class DBSystemError extends CustomException{

    public DBSystemError() {
        super(DBErrorType.toString(0));
    }

    public DBSystemError(DBErrorType type) {
        super(type.toString());
    }
}
