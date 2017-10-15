package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

public class DeleteBookAction extends ActionSupport {
    private String mIsbn;

    @Override
    public String execute() throws Exception {
        if (!ServletActionContext.getRequest().getMethod().equals("POST")) {
            return ERROR;
        }
        Application.getInstance().getDatabaseManager().deleteBook(mIsbn);
        return SUCCESS;
    }

    public void setIsbn(String isbn) {
        mIsbn = isbn;
    }
}
