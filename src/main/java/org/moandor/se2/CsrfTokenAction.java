package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;

import java.util.UUID;

public class CsrfTokenAction extends ActionSupport {
    private String mTokenId = "token-" + UUID.randomUUID();

    public String getTokenId() {
        return mTokenId;
    }
}
