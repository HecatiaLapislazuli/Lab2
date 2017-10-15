package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;

public class InfoNoticeAction extends ActionSupport {
    private String mNext;
    private String mTitle;
    private String mStrong;
    private String mMessage;
    private String mLinkName;

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public void setNext(String next) {
        mNext = next;
    }

    public String getNext() {
        return mNext;
    }

    public void setTitle(String title) {
        mTitle = title;
    }

    public String getTitle() {
        return mTitle;
    }

    public void setStrong(String strong) {
        mStrong = strong;
    }

    public String getStrong() {
        return mStrong;
    }

    public void setMessage(String message) {
        mMessage = message;
    }

    public String getMessage() {
        return mMessage;
    }

    public void setLinkName(String linkName) {
        mLinkName = linkName;
    }

    public String getLinkName() {
        return mLinkName;
    }
}
