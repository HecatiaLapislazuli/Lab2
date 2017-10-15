package org.moandor.se2;

import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class QueryBooksAction extends ActionSupport {
    private List<BookBean> mBooks;
    private String mAuthorName;

    @Override
    public String execute() throws Exception {
        mBooks = Application.getInstance().getDatabaseManager().getBooksByAuthorName(mAuthorName);
        if (mBooks.isEmpty()) {
            return ERROR;
        }
        return SUCCESS;
    }

    public void setAuthorName(String name) {
        mAuthorName = name;
    }

    public String getAuthorName() {
        return mAuthorName;
    }

    public List<BookBean> getBooks() {
        return mBooks;
    }
}
